# Maintainer:
# Contributor: Jat <chat@jat.email>

_pkgname="pulseaudio-module-xrdp"
pkgname="$_pkgname-git"
pkgver=0.8.r2.g2d62018
pkgrel=1
pkgdesc="xrdp pulseaudio module"
url="https://github.com/neutrinolabs/pulseaudio-module-xrdp"
license=('LGPL-2.1-only')
arch=('i686' 'x86_64' 'armv6h' 'armv7l' 'aarch64')

makedepends=(
  'check'
  'git'
  'libpulse'
  'meson'
  'tdb'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

install="$_pkgname.install"

_pkgsrc="$_pkgname"
_pkgsrc_pulse="pulseaudio.gitlab"
source=(
  "$_pkgsrc"::"git+$url.git#branch=devel"
  "$_pkgsrc_pulse"::"git+https://gitlab.freedesktop.org/pulseaudio/pulseaudio.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"
  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count "$_tag"...HEAD)
  _hash=$(git rev-parse --short=7 HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//; s/-/_/'
}

_build_pulse() (
  echo "Building pulseaudio..."

  local _pulseaudio_ver _ref
  _pulseaudio_ver=$(LANG=C LC_ALL=C pacman -Si pulseaudio | grep -Pom1 '^Version\s+:\s+\K(\S+)-[0-9\.]+')
  if grep -qm1 '+' <<< "$_pulseaudio_ver"; then
    _ref=$(sed -E 's&^\S+[+]g([a-f0-9]+)-\S+$&\1&' <<< ${_pulseaudio_ver})
  else
    _ref=v$(sed -E 's&^([0-9]+\.[0-9]+).*$&\1&' <<< ${_pulseaudio_ver})
  fi

  cd "$_pkgsrc_pulse"
  git -c advice.detachedHead=false checkout -f "${_ref:?}"

  local _meson_options=(
    -Ddoxygen=false
    -Dtests=false
  )

  meson build "${_meson_options[@]}"
)

_build_plugin() (
  echo "Building pulseaudio-module-xrdp..."

  cd "$_pkgsrc"
  sed -i '\#-I $(PULSE_DIR)/src#a -I $(PULSE_DIR)/build \\' src/Makefile.am

  autoreconf -ivf
  ./configure "PULSE_DIR=$srcdir/$_pkgsrc_pulse" --prefix='/usr' --libexecdir='/usr/lib'
  make
)

build() {
  _build_pulse
  _build_plugin
}

package() {
  depends=(
    'pulseaudio'
    'xrdp'
  )

  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install
}
