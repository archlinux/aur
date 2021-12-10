# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: GoliathLabs <register@xdfr.de>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Mark Pustjens <pustjens@dds.nl>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Smith Dhumbumroong <zodmaner@gmail.com>
_base=alpine
pkgname=${_base}-fancythreading
pkgver=2.25
pkgrel=1
pkgdesc="A free software email client, a rewrite of Pine which was a continuation of the venerable ELM."
arch=('i686' 'x86_64' 'aarch64')
url="http://${_base}.x10host.com/${_base}"
license=('APACHE')
depends=('gettext' 'krb5' 'libldap' 'pam')
optdepends=('aspell: spell-checking support'
  'hunspell: spell-checking support'
  'topal: glue program that links GnuPG and alpine')
provides=('pico' 'pine' 'alpine')
conflicts=('pico' 'pine' 'alpine' 're-alpine')
replaces=('pico' 'pine' 'alpine')
options=('!makeflags')
source=(${url}/release/src/${_base}-${pkgver}.tar.xz
  ${url}/patches/${_base}-${pkgver}/maildir.patch.gz
  ${url}/patches/${_base}-${pkgver}/fancy.patch.gz
  ${url}/patches/${_base}-${pkgver}/fillpara.patch.gz
  ${url}/patches/${_base}-${pkgver}/compose.patch.gz
  ${url}/patches/${_base}-${pkgver}/longurl.patch.gz)
sha512sums=('76c214cf66f4ac7af3de40357ad3a592ff2a119e327e5f6c256125b7865d46b09197435fe6ac8077ab7a498e4821925939f3f902431ca77baa786e149466a193'
  '2973302432d8b7611cc5998c19ce8d9965b2c18a0dd06693a3f409becb3173df5a63d5b87859994bf13d216200823148d00255e242e0bc33b3952cdc7025ee26'
  '9d029b538b0ef2bb218ce8b93fcee7b947b30cf513f260412ff54ad6109be6a6f61c03d3dba9c83befce258026dfe8052bbc331d21ba51e9c7bb5ed614856dee'
  '972abd27256a27c9f7fda1abd54075f9ff7a34cfeca29889d5209280ccd2bf8c547677516f10f3337da3efb97dd4f073fd9139bdd7e8429679036ab99547f734'
  '21460ea060574596757130ba18ab1f1fc2515b7a0eaf51d346524565c858a3dd2ec115aac8f293f9472427c4e0be8700d3be897b0165e5b2a786e263be7f2aa4'
  '23ee3c8f83da5b3e74a49accaa1c6fb974f2193e8a00d149696276093b633991eff30edd82cd91045909db65a71a6c0eb9bff229c60e43defb1d447af6d5922a')

prepare() {
  cd "${_base}-${pkgver}"
  # Apply select patches to Alpine
  # Maildir patch
  patch -p1 -i "${srcdir}/maildir.patch"
  # Fancy Thread Interface
  patch -p1 -i "${srcdir}/fancy.patch"
  # Justify paragraphs that contain more than one level of quoting
  patch -p1 -i "${srcdir}/fillpara.patch"
  # Add new subcommands to the compose command
  patch -p1 -i "${srcdir}/compose.patch"
  # Recognize multiline URLs
  patch -p1 -i "${srcdir}/longurl.patch"
}

build() {
  cd "${_base}-${pkgver}"
  LIBS+="-lpam -lkrb5 -lcrypto" ./configure \
    --prefix=/usr \
    --with-passfile=.pine-passfile \
    --without-tcl \
    --disable-shared \
    --with-system-pinerc=/etc/alpine.d/pine.conf \
    --with-system-fixed-pinerc=/etc/alpine.d/pine.conf.fixed
  make
}

package() {
  cd "${_base}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 NOTICE "${pkgdir}/usr/share/doc/${pkgname}/NOTICE"
  install -m644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -m644 README.maildir "${pkgdir}/usr/share/doc/${pkgname}/README.maildir"
}
