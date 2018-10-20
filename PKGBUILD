# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Firef0x <firefgx { at } gmail { dot } com>
# Contributor: Musikolo <musikolo {at} hotmail [dot] com>
# Contributor: Magician <magician21 ett lycos daht com>
# Contributor: Petrovo https://aur.archlinux.org/account.php?Action=AccountInfo&ID=33361
# Contributor: Pierre-François Gomez https://aur.archlinux.org/account/pef/
# Contributor: Shura https://aur.archlinux.org/account/shura/
# Original PKGBUILD file from:
# - https://bbs.archlinux.org/viewtopic.php?pid=757428#p757428
# - http://www.scootersoftware.com/vbulletin/showpost.php?s=3c1f289bc76655230b49f440dbe17b53&p=26449&postcount=7

pkgname=bcompare3
pkgver=3.3.13.18981
pkgrel=3
pkgdesc="Beyond Compare 3: Compare, sync, and merge files and folders"
arch=('i686' 'x86_64')
url="http://www.scootersoftware.com"
license=('custom')
makedepends=('python-html2text')
depends=('shared-mime-info' 'desktop-file-utils')
depends_i686=('libsm' 'libxcursor' 'libxft' 'libxinerama' 'libxrandr')
depends_x86_64=('lib32-libsm' 'lib32-libxcursor' 'lib32-libxft' 'lib32-libxinerama' 'lib32-libxrandr')
source=("http://www.scootersoftware.com/bcompare-${pkgver}.tar.gz"
        "license.html"::"http://www.scootersoftware.com/shop.php?zz=kb_license")
sha256sums=('325034adc1755846399acf99e672e5f46184a1fe24077d672edd18b7ece8c3d7'
            '14ed0bce947b574815df6a2326c0bea6c1207257b49f25bd501d927c576dfc1a')
options=('!strip') # Do not strip binaries because it breaks them down
conflicts=('bcompare' 'bcompare-beta')

#Set up platform-specific variables
[ "$CARCH" == x86_64 ] && _LIB_DIR='lib32' || _LIB_DIR='lib'

prepare() {
  # Prepare license file
  html2text --ignore-links --ignore-images --ignore-emphasis --body-width=80 < \
    license.html | sed -n '/# LICENSE AGREEMENT (V3)/,/remain in full force and effect./p' > LICENSE
}

build() {
  # Prepare the directory skeleton needed for install.sh
  mkdir -p "${srcdir}/build/usr/share/applications"
  mkdir -p "${srcdir}/build/usr/share/doc"
  mkdir -p "${srcdir}/build/usr/share/mime/packages"
  mkdir -p "${srcdir}/build/usr/share/pixmaps"

  # Apply some fixes on install.sh before run it
  cd "bcompare-${pkgver}"
  sed -i 's|/usr/|${PREFIX}/usr/|g' install.sh
  fakeroot ./install.sh --prefix="${srcdir}/build"

  # Fix wrong path
  sed -i "s|"${srcdir}/build"|/usr|g" "${srcdir}/build/bin/bcompare"
}

package() {
  cd "${srcdir}/build"

  # Install shell script file
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "bin/bcompare"

  # Install binary files
  install -m 755 -d "${pkgdir}/usr/${_LIB_DIR}/beyondcompare"
  install -m 755 -t "${pkgdir}/usr/${_LIB_DIR}/beyondcompare" "${_LIB_DIR}/beyondcompare/BCompare"
  install -m 644 -t "${pkgdir}/usr/${_LIB_DIR}/beyondcompare" "${_LIB_DIR}/beyondcompare"/{libqtc.so.1,libqt-mt.so.3,qtrc}

  # Install documentation and help files
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}/help"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${_LIB_DIR}/beyondcompare/README"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}/help" "${_LIB_DIR}/beyondcompare/help"/*
  ln -s "../../share/doc/${pkgname}/help" "${pkgdir}/usr/${_LIB_DIR}/beyondcompare/help"

  # Install application launcher
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "usr/share/applications/bcompare.desktop"

  # Install icons
  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  install -m 644 -t "${pkgdir}/usr/share/pixmaps" "usr/share/pixmaps"/*
  install -m 755 -d "${pkgdir}/usr/share/mime/"

  # Install MIME files
  install -m 755 -d "${pkgdir}/usr/share/mime/packages"
  install -m 644 -t "${pkgdir}/usr/share/mime/packages" "usr/share/mime/packages/bcompare.xml"

  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}
