# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: rtfreedman  <rob<d0t>til<d0t>freedman< T>googlemail<d0t>com>
# Contributor: Pyro Devil <p.devil@gmail.com>

pkgname=exfat-dkms-git
_gitname=exfat-nofuse
pkgver=198.01c30ad
pkgrel=1
pkgdesc='Native (nofuse) kernel module for EXtendedFAT support - use with DKMS'
arch=('any')
url='https://github.com/dorimanx/exfat-nofuse'
license=('GPL2')
depends=('dkms' 'exfat-utils-nofuse')
makedepends=('git')
conflicts=('exfat' 'exfat-git')
options=('!strip')
source=(git+https://github.com/dorimanx/exfat-nofuse.git
        dkms.conf
        4.18.patch
        4.20.patch)
sha512sums=('SKIP'
            'cbb4fff8f158d5feacd6ad9c4ec42e13b70891b532dd89eda5fd5b6327d22b702d69e46a268af73f04eefcf7deef78ba0a5cfb57381e38eb3493136b9628fd43'
            'dbe483c36e821a9e1eb7ec17ad1219444022c7f166b461dd6b2016cc7e7685deda7d3b665f5108dbc26e55425e0627dfae2fec6c19699da14adf6483bf0f8e3c'
            '708165888e301edbaeaecdc59ec440ccd43c1ee8f2e42cbbe76750f888c44fa7ba14d9f62ed41df36a347d3fda3dd76e0165ec4508f0d50906dfb6f03f467349')

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  # update PACKAGE_VERSION to pkgver
  sed -i "s/PACKAGE_VERSION=\"[-._ 0-9a-zA-Z]*\"/PACKAGE_VERSION=\"${pkgver}\"/g" "${srcdir}/dkms.conf"
  # apply 4.18 fix
  cd exfat-nofuse
  patch -p1 < "${srcdir}/4.18.patch"
  patch -p1 < "${srcdir}/4.20.patch"
}

package() {
  rm -fr ${_gitname}/{.git,.gitignore}

  mkdir -p "${pkgdir}/usr/src"
  cp -r ${_gitname} "${pkgdir}/usr/src/exfat-${pkgver}"

  install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/exfat-${pkgver}/dkms.conf"
}
