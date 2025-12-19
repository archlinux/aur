# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='trifold-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=0.4.3.r3.g034eb94
pkgrel=1
pkgdesc='A quick way to deploy static projects to a fast, cheap, and reliable CDN (development version)'
arch=('any')
url='https://codeberg.org/jpt/trifold'
license=('AGPL-3.0-or-later')  # SPDX-License-Identifier: AGPL-3.0-or-later
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=(
  'python'
  'python-httpx'
  'python-typer'
)
source=("$_srcname::git+$url.git")
provides=({,python-}"$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_srcname"

  git clean -dfx
}

build() {
  cd "$_srcname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  local _site_packages='<VOID>'
  _site_packages=$(
    python -c 'import site; print(site.getsitepackages()[0])'
  )
  export PATH="$pkgdir/usr/bin:$PATH"
  export PYTHONPATH="$pkgdir/$_site_packages"
  export _TYPER_COMPLETE_TEST_DISABLE_SHELL_DETECTION=true
  for _shell in bash fish zsh; do
    printf 'Generating completions for %-4s: ' "$_shell"
    trifold --show-completion "$_shell" > "completions.$_shell"
    printf '%s\n' "completions.$_shell"
  done

  install -vDm644 completions.bash "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -vDm644 completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
  install -vDm644 completions.zsh  "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    README.md trifold.toml docs/*.md

  cd "$pkgdir/usr/share/doc" && ln -vsrf "$pkgname" "$_pkgname"
}

# eof
