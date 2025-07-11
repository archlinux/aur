# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-bake-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=1.3.0.r0.gf4b1c9f
pkgrel=1
pkgdesc='Mbake: Format and lint Makefiles according to best practices (development version)'
arch=('any')
url='https://github.com/EbodShojaei/bake'
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
depends=(
  'python'
  'python-rich'
  'python-tomli'
  'python-typer'
)
source=("git+$url.git")
provides=({,m,python-}bake)
conflicts=("${provides[@]}" ruby-bake)
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  git describe --tags --long \
  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 .bake.toml.example \
    "$pkgdir/usr/share/doc/$pkgname/example/bake.toml"
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    ./*.md demo.mk
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE

  local _site_packages
  _site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
  _pythonpath="$pkgdir$_site_packages"

  for _shell in bash fish zsh; do
    env PYTHONPATH="$_pythonpath" \
      "$pkgdir/usr/bin/mbake" completions "$_shell" > "_completions.$_shell"
  done

  # Bash
  install -vDm0644 _completions.bash "$pkgdir/usr/share/bash-completion/completions/$_srcname"
  ln -vsrf "$pkgdir/usr/share/bash-completion/completions/"{,m}"$_srcname"

  # Fish
  install -vDm0644 _completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/$_srcname.fish"
  ln -vsrf "$pkgdir/usr/share/fish/vendor_completions.d/"{,m}"$_srcname.fish"

  # Zsh
  install -vDm0644 _completions.zsh  "$pkgdir/usr/share/zsh/site-functions/_$_srcname"
  ln -vsrf "$pkgdir/usr/share/zsh/site-functions/_"{,m}"$_srcname"
}

# eof
