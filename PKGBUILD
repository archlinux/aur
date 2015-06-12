# Maintainer: mdevlamynck <matthias.devlamynck@mailoo.fr>

pkgname=vim-gdbmgr
pkgver=1.0
pkgrel=1
pkgdesc="GDB (Gnu Debugger) Manager for Vim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=4104"
license=('custom')
groups=('vim-plugins')
depends=('vim' 'gdb')
install=vimdoc.install
source=("gdbmgr.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=18153"
	"gdbmgr.diff"
)

build() {
	rm $srcdir/gdbmgr.tar.gz

	# There may be a bug on current version.
	# By following the EXAMPLE 1 in gdbmgr-tutorial,
	# you probably would get blank in source window.
	# It seems that the author used a specific vimrc,
	# He must add '.' to PATH and set autochdir.
	# So the current edit file is always in the PATH.
	# I have a unofficial patch to fix this issue.
	# However, If the author updates some files, 
	# This patch may not works correctly.
	patch -p1 < gdbmgr.diff
	rm gdbmgr.diff

	cd $srcdir/gdbmgr/src
	make
}

package() {
	install -Dm644 $srcdir/gdbmgr/src/gdbmgr.so $pkgdir/usr/lib/gdbmgr.so
	cd $srcdir/gdbmgr/src/
	make clean

	# In the previous version, package will conflict with vim-align. 
	# (IT IS NOT MY FAAAAAUUUUUULT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!)
	# So just put everything in after-directory to avoid this issue.
	_vimdir=$pkgdir/usr/share/vim/vimfiles/
	mkdir -p $_vimdir/{after,doc}

	mv $srcdir/doc/* $_vimdir/doc
	rm $srcdir/doc -r
	mv $srcdir/* $_vimdir/after
}
md5sums=('f5f537f59f064be7d858c37cba8f2bcb'
         '74068b491216c9eb81e6544144663d88')
