# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_pkgname=vim-ipython
pkgname=vim-$_pkgname-git
pkgver=r165.42499f0
pkgrel=3
pkgdesc="A two-way integration between Vim and IPython 0.11+"
arch=('any')
url="https://github.com/ivanov/vim-ipython"
license=('')
groups=()
depends=('python2-ipykernel')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+$url.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  installpath="${pkgdir}/usr/share/vim/vimfiles"

  # insert code in pre-python.vim to ipy.vim
  # this sets the default pyx to be python3, which is necessary for arch
  cat >pre-python.vim << EOF
if has('python3')
    set pyx=3
elseif has('python')
    set pyx=2
endif
EOF

  cat pre-python.vim ftplugin/python/ipy.vim > temp.vim
  rm pre-python.vim
  mv temp.vim ftplugin/python/ipy.vim

  # install
  install -d $installpath/ftplugin/python
  install -Dm644 ftplugin/python/* $installpath/ftplugin/python
}
