# Maintainer:
# Contributor: xiretza <xiretza+aur@xiretza.xyz>

_pkgname="red-discordbot"
pkgname="$_pkgname-git"
pkgver=3.5.9.r4.g4242a7adf
pkgrel=2
pkgdesc="Red - A fully customizable Discord bot"
url="https://github.com/Cog-Creators/Red-DiscordBot"
license=('GPL-3.0-only')
arch=('any')

depends=(
  'python'
  'python-aiohttp'
  'python-aiohttp-json-rpc'
  'python-aiosqlite'
  'python-appdirs'
  'python-apsw'
  'python-async-timeout'
  'python-attrs'
  'python-babel'
  'python-chardet'
  'python-click'
  'python-colorama'
  'python-discord'
  'python-distro'
  'python-thefuzz'
  'python-idna'
  'python-levenshtein'
  'python-markdown'
  'python-multidict'
  'python-pip'
  'python-pytz'
  'python-red-lavalink'
  'python-rich'
  'python-schema'
  'python-setuptools'
  'python-tqdm'
  'python-typing_extensions'
  'python-uvloop'
  'python-yaml'
  'python-yarl'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-astroid'
  'python-dateutil'
  'python-iniconfig'
  'python-isort'
  'python-lazy-object-proxy'
  'python-mccabe'
  'python-more-itertools'
  'python-packaging'
  'python-pluggy'
  'python-psutil'
  'python-py'
  'python-pylint'
  'python-pyparsing'
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-mock'
  'python-six'
  'python-toml'
  'python-wrapt'
)

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git"
  "config_paths.patch"
  "${_pkgname}.sysusers"
  "${_pkgname}.tmpfiles"
  "${_pkgname}@.service")
sha256sums=('SKIP'
  '0cd709fe49761f47c77b2202ec7d11ae8e7cd5a3b93db5a3249d69ed81b5b49b'
  'c6e35e526e63c26e9f183cd37fdfeea10a7ebcc3ea13edd6fbbad51936897158'
  '62b30643e8e746b0cb07fea332aee6f33d8fcc2fccdbca8645176f175247cae1'
  '01b1c7827328d8940c37d240367ab72efdc346596305cb21cb6d2cba12a59391')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

_prepare() {
  cd "$_pkgsrc"

  # levenshtein-wheels 0.13.1 is the same as levenshtein 0.12.0, but with wheels
  # unpin all dependencies, since they don't usually match up with Arch's packages
  # replace -wheels packages with their normal counterparts
  sed --in-place --regexp-extended \
    -e 's/(python-Levenshtein-wheels)==0.13.1/\1==0.12.0/' \
    -e 's/==/>=/' \
    -e 's/-wheels//' \
    setup.cfg
  patch -p1 < "$srcdir/config_paths.patch"
}

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel --skip-dependency-check
}

check() {
  cd "$_pkgsrc"
  PYTHONPATH=. pytest || :
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" "${srcdir}/${_pkgname}@.service"
}
