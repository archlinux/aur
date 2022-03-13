# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira (faidoc) <alexfilgueira@antergos.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=csd-background
_realname=cinnamon-settings-daemon
pkgver=5.2.0
pkgrel=1
pkgdesc="The Cinnamon Settings daemon (background plugin only)"
arch=('x86_64')
url="https://github.com/linuxmint/${_realname}"
license=('GPL')
depends=('cinnamon-desktop' libnotify 'polkit')
optdepends=('cinnamon-translations: i18n')
makedepends=('meson' 'samurai')
conflicts=("$_realname")
options=('!emptydirs')
source=("${_realname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        strip-{plugins,dependencies}.patch)
sha512sums=('ae076956715bc7b47746868df0f1cb4034a8ce26b2d64878c74654f08a4498155063f16bf7972316fa138f72e10a82e8589fdb607f8072bbcd92e106bedbe98e'
            '5cd2697c6a9af2af278b20f4a5aff01727350e001ab29df98b79d501b38564497ea5ce23a8e9b3743f42db34f1cc15a5f46a3c3f3d0144cd9455d38ae587d1ef'
            '99578525531baf6e8436c393fd0c9643e4ca1fefaf78976d5bc6baa98e587907f4a4f0a5409e5a2f712d4a4b14fca1d6d2511b92ae984a801a3efb36a051e4ff')
b2sums=('aca6aac0a7b85fa9fb60f1101e0027d5faf3f6d95f7d306ae0ad9dd2e19bb1b48ab4333bbcdff5405b52c306f67eb34bfce895b37529d3ce015182aac41dcf07'
        'cf814f7059c24964f1242277a328c10813e81dbc2103c22148889b17a05c96d637ccc6c8aed7dbed3636798755158365482e719202a8c9620c89aacd672e074a'
        'b5e89c0d773945466635fab79dc43c88eecad2fecc626e6496275a425fb1ff331990a3289cd9ed5accc2a017abeff4eab17cd52d9d13ecd49fe5b8cf9a8f66ae')

prepare() {
   cd "${srcdir}"/${_realname}-${pkgver}
   patch -Np1 < ../strip-plugins.patch
   patch -Np1 < ../strip-dependencies.patch
}

build() {
    mkdir -p "${srcdir}"/${_realname}-${pkgver}/builddir
    cd "${srcdir}"/${_realname}-${pkgver}/builddir

    meson --prefix=/usr \
          --libexecdir="/usr/lib/${_realname}" \
          --buildtype=plain \
          ..

    samu
}

package() {
    cd "${srcdir}"/${_realname}-${pkgver}/builddir

     DESTDIR="${pkgdir}" samu install

     find "${pkgdir}" \( -type f -o -type l \) ! \( -name '*background*' -o -name '*.pc' -o -name '*.so' \) -delete
}
