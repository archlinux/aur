# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=diffoscope-git
pkgver=62+2+ge4731a6
pkgrel=1
pkgdesc='Tool for in-depth comparison of files, archives, and directories'
url='https://diffoscope.org/'
arch=('x86_64')
license=('GPL3')
depends=('python-magic' 'python-libarchive-c' 'python-setuptools')
optdepends=(
  'acl: access control list utilities support'
  'binutils: binary utilities support'
  'bzip2: bzip2 utilities support'
  'cdrkit: ISO utilities support'
  'colord: ICC profiles support'
  'cpio: cpio archive support'
  'diffutils: diff utilities support'
  'e2fsprogs: Ext2/3/4 filesystem utilities support'
  'enjarify: Android dex file support'
  'fpc: Free Pascal utilities support'
  'java-environment: java utilities support'
  #'libcaca: image compare support'
  'llvm: LLVM bitcode files support'
  'fontforge: bitmap font utilities support'
  'gettext: GNU internationalization utilities support'
  'ghc: haskell utilities support'
  'gnupg: GNU privacy guard support'
  'mono: mono support'
  'mono-tools: mono utilities support'
  'poppler: PDF utilities support'
  'sqlite: SQLite support'
  'squashfs-tools: squashfs filesystem support'
  #'python-guestfs: guestfs filesystem support'
  'tlsh: fuzzy matching supprt'
  'unzip: zip utilities support'
  'gzip: gzip utilities support'
  'tar: tar utilities support'
  'vim: Vi IMproved (xxd) utilities support'
  'xz: XZ and LZMA utilities support'
)
makedepends=('git')
checkdepends=(
  'python-pytest' 'acl' 'binutils' 'bzip2' 'cdrkit' 'cpio' 'diffutils' 'e2fsprogs' 'enjarify' 'java-environment>=8' 'fontforge' 'gettext' 'ghc' 'gnupg'
  'mono' 'mono-tools' 'poppler' 'sqlite' 'squashfs-tools' 'tlsh' 'unzip' 'gzip' 'tar' 'vim' 'xz' 'llvm' 'colord' 'fpc')
provides=('diffoscope')
conflicts=('diffoscope')
source=(${pkgname}::git+https://anonscm.debian.org/git/reproducible/diffoscope.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags|sed 's|-|+|g'
}

prepare() {
  cd ${pkgname}
  sed '/python-magic/d' -i setup.py
}

build() {
  cd ${pkgname}
  python setup.py build
}

check() {
  cd ${pkgname}
  # TODO: readd fpc
  # TODO: colord test fails with lcms2 >= 2.8
  PYTHONPATH=".:${PYTHONPATH}" py.test -k 'not test_icc and not test_ppu'
}

package() {
  cd ${pkgname}
  python setup.py install --skip-build -O1 --root="${pkgdir}"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
