# Maintainer:
# Contributor: Carlo Capocasa <carlo@capocasa.net>
# Contributor: Peter Sutton <peter@foxdogstudios.com>

_module="pyo"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=1.0.6
pkgrel=2
pkgdesc="Python DSP module"
url="https://github.com/belangeo/pyo"
license=('LGPL-3.0-or-later')
arch=('x86_64')

depends=(
  'liblo'
  'libsndfile'
  'portaudio'
  'portmidi'
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'wxpython: wxWidgets GUI'
)

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/$pkgver.$_pkgext")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"

  local mapping mappings=(
    "use-double::USE_DOUBLE"
    "no-messages::NO_MESSAGES"
    "compile-externals::COMPILE_EXTERNALS"
    "debug::DEBUG"
    "fast-compile::FAST_COMPILE"
    "minimal::MINIMAL"
    "use-jack::USE_JACK"
    "jack-force-old-api::JACK_FORCE_OLD_API"
    "use-coreaudio::USE_COREAUDIO"
  )

  for mapping in "${mappings[@]}"; do
    local flag="${mapping%%::*}"   # left side before ::
    local envvar="${mapping##*::}" # right side after ::
    echo "Patching --$flag → $envvar"
    sed -i "s/if \"--$flag\" in sys.argv:/if os.environ.get(\"$envvar\"):/g" setup.py
    sed -Ei 's/^([[:space:]]*)sys\.argv\.remove\(".*"\)/\1pass/' setup.py
  done

  # fix license format warning
  sed -E -e 's&^(license) = .*$&\1 = "LGPL-3.0-or-later"&' -i setup.py

  # downgrade C standard to prevent errors
  sed -e '/^extra_compile_args = /a extra_compile_args.append("-std=gnu11")' \
    -i setup.py
}

build() {
  cd "$_pkgsrc"
  USE_DOUBLE=1 USE_JACK=1 python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgsrc"
  USE_DOUBLE=1 USE_JACK=1 python -m installer --compile-bytecode=2 --destdir="$pkgdir" dist/*.whl
}
