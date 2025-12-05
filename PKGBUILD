# Maintainer: willemw <willemw12@gmail.com>

# Use these default values to build to the latest git commit version.
#SICKCHILL_LATEST_COMMIT=1
#SICKCHILL_BRANCH=develop

# OR

# Set these values to build the latest release version.
#SICKCHILL_LATEST_COMMIT=0
# Or set another branch.
#SICKCHILL_BRANCH=master
# And/or set another release.
#SICKCHILL_VERSION=2024.3.1

# This "PIP install" package is similar to a VCS package.
# It has a pkgver() function. And a reinstall updates the package.
# That is the only reason why this package ends on "-git".

pkgname=sickchill-git
pkgver=2024.3.1.r0.20251205.latest
pkgrel=1
pkgdesc='Automatic video library manager for TV shows'
arch=(any)
url=https://sickchill.github.io
license=(GPL-3.0-or-later)
makedepends=(git jq python-virtualenv)
optdepends=(
  'libmediainfo: determine the resolution of MKV and AVI files with no resolution in the filename'
  'unrar: for RAR files')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
install=$pkgname.install
source=(
  sickchill.service
  sickchill.sysusers
  sickchill.tmpfiles)
sha256sums=(
  'b417284472d804e634c0dcaac2876ca164ad9a485f947e0f05798d0ce1136d59'
  'aaeb298c9717da8b28853ed15509fb8428d975ae49e8737ebcec15caab9f0978'
  '2069f15e18fc7dd0f0f25b623f2067fc9028b1ca4122021a62364aa39914f88f')

pkgver() {
  local version
  version="$(curl -s "https://pypi.org/pypi/${pkgname%-git}/json" | jq --raw-output --join-output '.info.version')"
  printf "%s.r0" "$version" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

  if [[ ! -v SICKCHILL_LATEST_COMMIT ]] || ((SICKCHILL_LATEST_COMMIT)); then
    # SICKCHILL_LATEST_COMMIT is enabled
    printf '.%(%Y%m%d)T.latest' '-1'
  fi
  return 0
}

build() {
  if [[ -v SICKCHILL_LATEST_COMMIT ]] && ! ((SICKCHILL_LATEST_COMMIT)); then
    # SICKCHILL_LATEST_COMMIT is not set or not enabled
    SICKCHILL_LATEST_COMMIT=0
    : "${SICKCHILL_BRANCH:=master}"
    #: "${SICKCHILL_VERSION:=2024.3.1}"
  else
    SICKCHILL_LATEST_COMMIT=1
    : "${SICKCHILL_BRANCH:=develop}"
    unset SICKCHILL_VERSION
  fi
  printf 'PKGBUILD configuration: SICKCHILL_LATEST_COMMIT=%s, SICKCHILL_BRANCH=%s, SICKCHILL_VERSION=%s\n' \
    "$SICKCHILL_LATEST_COMMIT" "$SICKCHILL_BRANCH" "$SICKCHILL_VERSION"

  if ((SICKCHILL_LATEST_COMMIT)); then
    _pip_install_arg="git+https://github.com/SickChill/sickchill.git@$SICKCHILL_BRANCH"
  else
    if [[ -n "$SICKCHILL_VERSION" ]]; then
      _pip_install_arg=sickchill==$SICKCHILL_VERSION
    else
      _pip_install_arg=sickchill # Latest released version
    fi
  fi

  set -x
  #python -m venv build
  export XDG_CACHE_HOME=cache/pip
  VIRTUALENV_OVERRIDE_APP_DATA=cache/virtualenv virtualenv build
  PIP_CONFIG_FILE=/dev/null build/bin/pip install \
    --ignore-installed --isolated --cache-dir=cache --prefix=. --root=build \
    --default-timeout=60 --disable-pip-version-check --no-warn-script-location --progress-bar=off \
    setuptools "$_pip_install_arg"
  { set +x; } 2>/dev/null

  sed -i '1s|.*|#!/opt/sickchill/app/bin/python|' build/bin/SickChill

  # Patch for error "TypeError: ExtensionManager._load_one_plugin() got an unexpected keyword argument 'verify_requirements'"
  if ((SICKCHILL_LATEST_COMMIT)); then
    sed -i 's| \(verify_requirements=False,\)| #\1|' build/lib/python*/site-packages/subliminal/extensions.py
  fi
}

package() {
  install -Dm644 sickchill.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 sickchill.sysusers "$pkgdir/usr/lib/sysusers.d/sickchill.conf"
  install -Dm644 sickchill.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/sickchill.conf"

  install -dm755 "$pkgdir/opt/sickchill"
  cp -a build "$pkgdir/opt/sickchill/app"
}
