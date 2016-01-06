# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=diffoscope-git
pkgver=45.551.a0f6f85
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
  'cpio: cpio archive support'
  'diffutils: diff utilities support'
  'e2fsprogs: Ext2/3/4 filesystem utilities support'
  'enjarify: Android dex file support'
  'fpc: Free Pascal utilities support'
  'java-environment: java utilities support'
  #'libcaca: image compare support'
  'fontforge: bitmap font utilities support'
  'gettext: GNU internationalization utilities support'
  'ghc: haskell utilities support'
  'gnupg: GNU privacy guard support'
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
# TODO: readd fpc
checkdepends=(
  'python-pytest' 'acl' 'binutils' 'bzip2' 'cdrkit' 'cpio' 'diffutils' 'e2fsprogs' 'enjarify' 'java-environment' 'fontforge' 'gettext' 'ghc' 'gnupg'
  'mono-tools' 'poppler' 'sqlite' 'squashfs-tools' 'tlsh' 'unzip' 'gzip' 'tar' 'vim' 'xz')
provides=('diffoscope')
conflicts=('diffoscope')
source=(${pkgname}::git+https://anonscm.debian.org/git/reproducible/diffoscope.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  PYTHONPATH=".:${PYTHONPATH}" py.test
}

package() {
  cd ${pkgname}
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
