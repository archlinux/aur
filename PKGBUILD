# Maintainer: Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>

pkgname=nhentai-git
pkgver=r439.05e6ceb
pkgrel=2
pkgdesc='CLI tool for downloading doujinshi from nhentai.net'
arch=(any)
url=https://github.com/RicterZ/"${pkgname%-*}"
license=(custom:MIT)

depends=(
  'python-requests>=2.5.0'
  # python-soupsieve
  'python-beautifulsoup4>=4.0.0'
  # python-threadpoolctl
  'python-tabulate>=0.7.5'
  'python-future>=0.15.2'
  'python-iso8601>=0.1'
)
makedepends=(git python-setuptools)

provides=({,python-}"${pkgname%-*}")
conflicts=("${provides[@]}" python-$pkgname)
source=(git+https://github.com/RicterZ/"${pkgname%-*}".git)
md5sums=(SKIP)

# prepare() {

#   local _T=doujinshi.txt
#   local _N
#   local _RAND
#   local _PATTERN='https://nhentai.net/g/[1-9][0-9]*/' # Pattern
#   local _ID

#   # https://knowyourmeme.com/memes/boku-no-pico
#   printf "${BLUE}  ->${ALL_OFF}${BOLD} Replace Yoooooooooooooooooooooooo(s) with random ID${ALL_OFF}\n" "$@"
#   cd "$srcdir/${pkgname%-*}"

#   # https://stackoverflow.com/a/114861
#   _N="$(grep -cv '^\s*$' $_T)"
#   [ "$_N" -ge 1 ]
#   rm -v $_T

#   # https://unix.stackexchange.com/q/278496
#   # for i in eval {1..$_N}
#   for ((i=0;i<_N;++i)); do

#     # https://stackoverflow.com/a/3077316
#     _RAND="$(curl -ILs -o /dev/null -w %{url_effective} https://nhentai.net/random/)"
#     [ "$_RAND" = "$(grep -oE "$_PATTERN" <<<"$_RAND")" ]

#     _ID="$(grep -oE '[0-9]+' <<<"$_RAND")"
#     [ "$_ID" -ge 1 ]

#     echo "$_ID" >>$_T

#   done

# }

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-*}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-*}"
  # export PYTHONHASHSEED=0
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -vDm644 {,"$pkgdir/usr/share/licenses/${pkgname}/"}LICENSE
}
