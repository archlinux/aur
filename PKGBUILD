# Maintainer:
# Contributor: Chris Warrick <aur@chriswarrick.com>
# Contributor: shmilee <echo c2htaWxlZS56anVAZ21haWwuY29tCg==|base64 -d>

_pkgname="nikola"
pkgname="$_pkgname-git"
pkgver=8.3.1.r2.gf7989de
pkgrel=1
pkgdesc="A static site and blog generator"
url="https://github.com/getnikola/nikola"
license=('MIT')
arch=('any')

depends=('python')
depends=(
  python
  python-babel
  python-blinker
  python-dateutil
  python-docutils
  python-doit
  python-logbook
  python-lxml
  python-mako
  python-markdown
  python-natsort
  python-piexif
  python-pillow
  python-pygments
  python-pyrss2gen
  python-requests
  python-setuptools # https://github.com/getnikola/nikola/issues/3743
  python-unidecode
)
makedepends=(
  git
  jupyter-notebook
  python-aiohttp
  python-build
  python-ghp-import
  python-husl
  python-html5lib
  python-installer
  python-ipykernel
  python-jinja
  python-micawber
  python-phpserialize
  python-pygal
  python-pyphen
  python-ruamel-yaml
  python-toml
  python-typogrify
  python-watchdog
  python-wheel
  zeromq
)
checkdepends=(
  libwebp
  python-feedparser
  python-freezegun
  python-pytest
)
optdepends=(
  'libwebp: for WEBP image file support'
  'jupyter-notebook: for .ipynb support'
  'python-aiohttp: for nikola auto'
  'python-ghp-import: for upload to Github pages'
  'python-hsluv: for section color mixing'
  'python-html5lib: for HTML5 minify and format support'
  'python-husl: for optional color support'
  'python-ipykernel: for .ipynb support'
  'python-jinja: for jinja2 based themes'
  'python-micawber: for embedding media in posts'
  'python-phpserialize: for Wordpress import'
  'python-pygal: for SVG graph plotting'
  'python-pyphen: for hyphenation support'
  'python-ruamel-yaml: for YAML support'
  'python-toml: for TOML support'
  'python-typogrify: for typographical enhancements'
  'python-watchdog: for nikola auto'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation

  # shell completions
  python -m "$_pkgname" tabcompletion --shell bash --hardcode-tasks > "${_pkgname}_bash"
  python -m "$_pkgname" tabcompletion --shell zsh --hardcode-tasks > "${_pkgname}_zsh"

  # ensure that the shell completion is assigned to the correct executable
  sed -e "s/__main__.py/$_pkgname/g" -i "${_pkgname}_"{bash,zsh}
}

check() {
  local pytest_options=(
    -vv
    -o addopts=''
  )
  cd "$_pkgsrc"
  pytest "${pytest_options[@]}"
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "${_pkgname}_bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm644 "${_pkgname}_zsh" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"

  install -Dm644 docs/man/nikola.1.gz "$pkgdir/usr/share/man/man1/nikola.1.gz"

  for i in manual theming extending creating-a-site creating-a-theme; do
    install -Dm644 "docs/$i.rst" -t "$pkgdir/usr/share/doc/$pkgname/"
  done
}
