# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Eric Engestrom (https://aur.archlinux.org/account/1ace)

_pkgname=igt-gpu-tools
pkgname="$_pkgname-git"
pkgver=2.2+340.r15769.20251204.9410b6926
pkgrel=1
pkgdesc="Collection of tools for development and testing of the DRM drivers."
url="https://gitlab.freedesktop.org/drm/igt-gpu-tools"
arch=(
  "x86_64"
  'i686'
  "aarch64"
)
license=("LicenseRef-several_in_onefile")
makedepends=(
  'bison'
  'flex'
  git
  meson
  ninja
  peg # For executable `leg`, needed to build with `-Doverlay=enabled`.
  'python>=3'
  'python-docutils'
  'python-sphinx'
  'rst2pdf'
  valgrind
)
depends=(
  alsa-lib
  bash
  cairo
  glib2
  glibc
  gsl
  gtk-doc
  json-c
  kmod
  libdrm
  libelf
  liboping
  libpciaccess
  libunwind
  libx11
  libxext
  libxmlrpc
  libxrandr
  libxv
  openblas
  perl
  pixman
  procps-ng
  python-docutils
  systemd-libs
  # valgrind
  zlib
)
checkdepends=(
  'rst2pdf'
  'python-roman'  # Otherwise, in `check()`, when importing 'rst2pdf.pdfbuilder', error 'rst2pdf.pdfbuilder (exception: No module named roman)' is thrown.
)
optdepends=(
  "python>=3:              To use /usr/bin/code_cov_gather_on_test and /usr/bin/intel-gfx-fw-info"
  "python-dissect.cstruct: To use /usr/bin/intel-gfx-fw-info"
)
provides=(
  "${_pkgname}=${pkgver}"
  "gputop=${pkgver}"
  "lsgpu=${pkgver}"
  "dpcd_reg=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  gputop
  lsgpu
  dpcd_reg
)

# options+=('!lto')

source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log

  cd "${srcdir}"

  MESON_OPTS=(
    "-Doverlay=enabled"
    "-Doverlay_backends=['x','xv']"
    "-Dchamelium=enabled"
    "-Dvalgrind=enabled"
    "-Dman=enabled"
    "-Dtestplan=enabled"
    "-Dsphinx=enabled"
    "-Ddocs=disabled" # If enabled, `meson install` fails with `ERROR: Error in gtkdoc helper script:`.
    "-Dtests=enabled"
    "-Dxe_driver=enabled"
    "-Dlibdrm_drivers=['intel','nouveau','amdgpu']"
    "-Dlibunwind=enabled"
    "-Drunner=enabled"
    "-Doping=enabled"
  )
  meson setup --prefix /usr --libexecdir lib --sbindir bin --buildtype plain --auto-features enabled --wrap-mode nodownload "${_pkgname}" build "${MESON_OPTS[@]}"
}

pkgver () {
  cd "${srcdir}/${_pkgname}"
  _ver="$(git describe  --tags | sed 's|^v||' | sed 's|-[^-]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}"
  ninja -C build
}

# Some tests time out after 30s and are killed by the test running system, making `check()` failing. So we disable them here.
#check() {
#  cd "${srcdir}"
#  ninja -C build test
#}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/docs/testplan/pdf" "build/docs/testplan/pdf/tests.pdf"

  cd "${srcdir}/${_pkgname}"
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log CONTRIBUTING.md MAINTAINERS NEWS README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "COPYING"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}
