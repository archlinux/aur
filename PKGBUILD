# Maintainer: Audun-Marius Gangstø <audun@gangsto.org>
pkgname=123-bin
pkgver=3.0
pkgrel=4
epoch=
pkgdesc="Create, modify, and process financial or scientific models."
arch=("i386" "i686" "x86_64")
url="https://github.com/taviso/123elf"
license=('unknown')
groups=()
depends=("lib32-ncurses")
makedepends=('unzip' 'cpio' 'gcc' 'binutils' 'xz' 'git')
checkdepends=()
optdepends=()
provides=('123')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
BINUTILS_DL="https://ftp.gnu.org/gnu/binutils"
BINUTILS_XZ="binutils-2.38.tar.xz"
source=("${pkgname}::git+https://github.com/taviso/123elf.git"
"https://archive.org/download/123-unix/123UNIX1.IMG"
"https://archive.org/download/123-unix/123UNIX2.IMG"
"https://archive.org/download/123-unix/123UNIX3.IMG"
"https://archive.org/download/123-unix/123UNIX4.IMG"
"https://archive.org/download/123-unix/123UNIX5.IMG"
"$BINUTILS_DL/$BINUTILS_XZ"
)
noextract=(
'123UNIX1.IMG'
'123UNIX2.IMG'
'123UNIX3.IMG'
'123UNIX4.IMG'
'123UNIX5.IMG'
"$BINUTILS_XZ"
)
sha256sums=(
    'SKIP'
    '09996c4e8e33f83cacbde257ad4b04ca6b1432102b1d6eef28e64bdf5d6b7315'
    '4bdc6559105fbf9e2237b06a896b2ea34ecadef086bdc08b1ee2b4928ad51239'
    '336a30d68115b4f2a51c8aee4605b5f95d7bfd22e43c6a5779b9938563929f87'
    '5a2fdc33cde7056522aa47740460cd44873e4b8c3bb4d3891b06610e95dd4218'
    '444d28234594436334231aaa06431bee3323ce7e300ba8e7c62fe16c87c11681'
    'e316477a914f567eccc34d5d29785b8b0f5a10208d36bbacedcc39048ecfe024'
    )
validpgpkeys=()

prepare() {
    cp 123UNIX1.IMG 123UNIX2.IMG 123UNIX3.IMG 123UNIX4.IMG 123UNIX5.IMG "$BINUTILS_XZ" "$pkgname"/
	cd "$pkgname"
    y | ./extract.sh
}

build() {
    cd "$pkgname"
    KEYMAPS=""
    for k in xterm rxvt-unicode-256color xterm-256color rxvt terminology; do
        [ -e /usr/share/terminfo/${k:0:1}/$k ] && KEYMAPS="${KEYMAPS} ${k}";
    done
    ./binutils.sh || true
    PATH="$PWD:$PATH" make KEYMAPS="$KEYMAPS"
}

check() {
	cd "$pkgname"
	make -k check
}

package() {
	cd "$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    make prefix="$pkgdir/usr" KEYMAPS="$KEYMAPS" install
}
