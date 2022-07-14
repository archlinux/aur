# Contriburor: graysky <graysky AT archlinux DOT us>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Zucchelli <zukka77@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Jonathan Liu <net147@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

_pkgname=lxc
_pkgvariant=nosystemd
pkgname="${_pkgname}-${_pkgvariant}-git"
pkgver=5
pkgrel=1
pkgdesc="Linux Containers git version. Without systemd dependencies."
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'x86_64'
)
url="https://linuxcontainers.org"
depends=(
  'bash'
  'libcap'
  'libseccomp'
  'perl'
  'python'
  'rsync'
  'wget'
)
makedepends=(
  'apparmor'
  'docbook2x'
  'doxygen'
  'git'
  'lua'
  'meson'
  'python-setuptools'
)
optdepends=(
  'lua'
  'lua-filesystem: lxc-top'
  'lua-alt-getopt: lxc-top'
)
license=('LGPL')
options=('emptydirs')
backup=('etc/lxc/default.conf'
  'etc/default/lxc')
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-git=${pkgver}"
  "${_pkgname}-${_pkgvariant}=${pkgver}"
  "${_pkgname}-sysvinit=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-git"
  "${_pkgname}-${_pkgvariant}"
  'anbox-launchers-git'
)
source=(
  "${_pkgname}::git+https://github.com/lxc/lxc.git"
  # to build from the stable branch instead of master use
  # ${_pkgname}-stable-4.0::git+https://github.com/lxc/lxc.git#branch=stable-4.0
  "lxc.tmpfiles.d"
)
sha256sums=(
  'SKIP'
  '10e4f661872f773bf3122a2f9f2cb13344fea86a4ab72beecb4213be4325c479'
)

prepare() {
  cd "${srcdir}"

  mkdir -p 'build'
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/^lxc-//;s/\([^-]*-g\)/r\1/;s/-/./g'

  _ver="$(git describe --tags | sed -E -e 's|^lxc[+-]||' -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}"
  arch-meson "${_pkgname}" 'build'
  meson compile -C build
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="$pkgdir" install
  install -d -m755 "$pkgdir/var/lib/lxc"
  install -d -m755 "$pkgdir/usr/lib/lxc/rootfs/dev"
  install -D -m644 "$srcdir"/lxc.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/lxc.conf

  cd doc
  find . -type f -name '*.1' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man1/{}" \;
  find . -type f -name '*.5' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man5/{}" \;
  find . -type f -name '*.7' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man7/{}" \;
}
