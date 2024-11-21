# Maintainer: jensgrunzer <jensgrunzer@gmail.com>
_pkgname=swingmusic
pkgname="${_pkgname}-git"
pkgrel=1
pkgdesc="Swing Music is a beautiful, self-hosted music player for your local audio files"
arch=(any)
pkgver=r1120.a263736
url="https://swingmx.com/"
license=('MIT')
groups=()
provides=("${_pkgname}")
depends=()
makedepends=('python311' 'yarn' 'glibc' 'libnghttp2' 'icu' 'git')
optdepends=('ffmpeg: audio silence skip feature')
conflicts=()
replaces=()
source=("${_pkgname}::git+https://github.com/swingmx/swingmusic.git"
	"swingmusic-client::git+https://github.com/swingmx/webclient")
sha256sums=('SKIP' 'SKIP')
pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}
build() {
  python3.11 -m venv poetry
  source poetry/bin/activate

  cd swingmusic

  pip install -U pip setuptools
  pip install poetry

  cd ../swingmusic-client
  yarn install
  yarn build --outDir ../swingmusic/client

  cd ../swingmusic
  # Fixes poetry issue 5250.
  export PYTHON_KEYRING_BACKEND=keyring.backends.fail.Keyring
  poetry env use /usr/bin/python3.11
  poetry install
  # Swing gives error if this is not set. Set to version of repo you cloned.
  export SWINGMUSIC_APP_VERSION="${pkgver}"
  poetry run python manage.py --build
}
package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755  dist/swingmusic -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
