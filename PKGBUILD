# Maintainer: Your Name <you@example.com>

pkgname=gvisor
pkgver=20261116.0
pkgrel=1
pkgdesc='Application kernel and OCI runtime (runsc) for sandboxed containers'
arch=('x86_64' 'aarch64')
url='https://gvisor.dev'
license=('Apache-2.0')
optdepends=(
  'docker: Docker runtime integration'
  'containerd: containerd shim integration'
)
makedepends=('git' 'bazelisk')
provides=('runsc')
conflicts=('gvisor-bin' 'gvisor-git')
options=('!lto' '!strip')
source=("${pkgname}::git+https://github.com/google/gvisor.git#tag=release-${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"

  export XDG_CACHE_HOME="${srcdir}/.cache"
  local bazel_root="${srcdir}/.bazel"

  trap 'bazelisk --output_user_root="${bazel_root}" shutdown >/dev/null 2>&1 || true' EXIT

  bazelisk --output_user_root="${bazel_root}" build \
    --compilation_mode=opt \
    --verbose_failures \
    //runsc:runsc \
    //shim/...
}

package() {
  cd "${srcdir}/${pkgname}"

  local runsc_bin shim_bin
  runsc_bin="$(find -L bazel-bin/runsc -maxdepth 2 -type f -executable -name 'runsc' | head -n 1)"
  shim_bin="$(find -L bazel-bin/shim -maxdepth 2 -type f -executable -name 'containerd-shim-runsc-v1' | head -n 1)"

  install -Dm755 "${runsc_bin}" "${pkgdir}/usr/bin/runsc"
  install -Dm755 "${shim_bin}" "${pkgdir}/usr/bin/containerd-shim-runsc-v1"
}
