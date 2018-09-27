# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=diffoscope-git
pkgver=102+2+g89e7e67
pkgrel=1
pkgdesc='Tool for in-depth comparison of files, archives, and directories'
url='https://diffoscope.org/'
arch=('x86_64')
license=('GPL3')
depends=('python-magic' 'python-libarchive-c' 'python-setuptools' 'python-distro' 'python-defusedxml')
optdepends=(
  'acl: access control list utilities support'
  'binutils: binary utilities support'
  'binwalk: binwalk support'
  'bzip2: bzip2 utilities support'
  'cdrtools: ISO utilities support'
  'colord: ICC profiles support'
  'cpio: cpio archive support'
  'diffutils: diff utilities support'
  'docx2txt: docx comparing support'
  'dtc: device tree comparing support'
  'e2fsprogs: Ext2/3/4 filesystem utilities support'
  'enjarify: Android dex file support'
  'imagemagick: ImageMagick identify support'
  'fpc: Free Pascal utilities support'
  'java-environment: java utilities support'
  'libcaca: image compare support'
  'llvm: LLVM bitcode files support'
  'odt2txt: odt comparing support'
  'fontforge: bitmap font utilities support'
  'gettext: GNU internationalization utilities support'
  'ghc: haskell utilities support'
  'giflib: gifbuild utilities support'
  'gnupg: GNU privacy guard support'
  'gnumeric: GNOME Spreadsheet support'
  'mono: mono support'
  'openssh: OpenSSH key comparing support'
  'poppler: PDF utilities support'
  'r: R language support'
  'sqlite: SQLite support'
  'squashfs-tools: squashfs filesystem support'
  #'python-guestfs: guestfs filesystem support'
  'python-argcomplete: completion support'
  'python-jsbeautifier: javascript beautifier support'
  'python-progressbar: show progressbar support'
  'tcpdump: pcap matching support'
  'python-tlsh: fuzzy matching supprt'
  'unzip: zip utilities support'
  'gzip: gzip utilities support'
  'tar: tar utilities support'
  'xxd: xxd utilities support'
  'xz: XZ and LZMA utilities support'
)
makedepends=('git' 'help2man' 'python-docutils')
checkdepends=(
  'python-pytest' 'python-jsbeautifier' 'acl' 'binutils' 'bzip2' 'cdrtools' 'cpio' 'diffutils' 'e2fsprogs' 'enjarify' 'imagemagick'
  'java-environment>=8' 'fontforge' 'gettext' 'ghc' 'gnupg' 'mono' 'mono-tools' 'poppler' 'sqlite' 'squashfs-tools'
  'python-tlsh' 'unzip' 'gzip' 'tar' 'tcpdump' 'vim' 'xz' 'llvm' 'colord' 'fpc' 'openssh' 'odt2txt' 'docx2txt' 'r' 'dtc' 'giflib'
  'gnumeric' 'python-progressbar' 'binwalk' 'python-argcomplete')
provides=('diffoscope')
conflicts=('diffoscope')
source=(${pkgname}::"git+https://salsa.debian.org/reproducible-builds/diffoscope.git")
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
  make -C doc
}

check() {
  cd ${pkgname}
  PYTHONPATH=".:${PYTHONPATH}" py.test \
    -k 'not test_gnumeric and not test_ppu'
}

package() {
  cd ${pkgname}
  python setup.py install --skip-build -O1 --root="${pkgdir}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 doc/diffoscope.1 -t "${pkgdir}/usr/share/man/man1"
}

# vim: ts=2 sw=2 et:
