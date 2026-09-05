pkgname=openbitdo-bin
pkgver=0.0.3
_upstream_tag=v0.0.3
pkgrel=1
pkgdesc="Prebuilt beginner-first clean-room 8BitDo utility"
arch=('x86_64' 'aarch64')
url="https://github.com/bybrooklyn/openbitdo"
license=('GPL-3.0-or-later')
depends=('glibc' 'systemd-libs')
source_x86_64=("openbitdo-${_upstream_tag}-linux-x86_64.tar.gz::${url}/releases/download/${_upstream_tag}/openbitdo-${_upstream_tag}-linux-x86_64.tar.gz")
source_aarch64=("openbitdo-${_upstream_tag}-linux-aarch64.tar.gz::${url}/releases/download/${_upstream_tag}/openbitdo-${_upstream_tag}-linux-aarch64.tar.gz")
sha256sums_x86_64=('5fc11380db7a8ce84e6a2a359b2958c1da97695bb9ac8bdc6f2d2d71368761ec')
sha256sums_aarch64=('b9fcf5f7d74ddc4a0c66e8769c2d05ba97c3d265a8cc7c1da7c5afef9c51d84d')

package() {
  local extracted_dir
  extracted_dir="$(find "${srcdir}" -maxdepth 1 -type d -name "openbitdo-${_upstream_tag}-linux-${CARCH}" | head -n 1)"
  if [[ -z "${extracted_dir}" ]]; then
    echo "unable to locate extracted release payload for ${CARCH}" >&2
    return 1
  fi

  install -Dm755 "${extracted_dir}/bin/openbitdo" "${pkgdir}/usr/bin/openbitdo"
  install -Dm644 "${extracted_dir}/share/udev/rules.d/99-openbitdo.rules" "${pkgdir}/usr/lib/udev/rules.d/99-openbitdo.rules"
  install -Dm644 "${extracted_dir}/share/bash-completion/completions/openbitdo" "${pkgdir}/usr/share/bash-completion/completions/openbitdo"
  install -Dm644 "${extracted_dir}/share/fish/vendor_completions.d/openbitdo.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/openbitdo.fish"
  install -Dm644 "${extracted_dir}/share/zsh/site-functions/_openbitdo" "${pkgdir}/usr/share/zsh/site-functions/_openbitdo"
  install -Dm644 "${extracted_dir}/README.md" "${pkgdir}/usr/share/doc/openbitdo/README.md"
  install -Dm644 "${extracted_dir}/LICENSE" "${pkgdir}/usr/share/licenses/openbitdo/LICENSE"
}
