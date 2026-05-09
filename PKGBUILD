# Maintainer: Matheus Afonso Martins Moreira <matheus@matheusmoreira.com>
pkgname=virtdev-git
pkgver=r307.0b213b5
pkgrel=1
pkgdesc='Isolated virtual development machines on KVM/QEMU'
arch=('x86_64')
url='https://github.com/matheusmoreira/virtdev'
license=('AGPL-3.0-or-later')
depends=(
  'bash>=5.2'
  'qemu-img'
  'qemu-system-x86'
  'edk2-ovmf'
  'openssh'
  'socat'
)
optdepends=(
  'archiso: required for building the installation ISO (virtdev-iso)'
  'rsync: required for backup, restore, transfer, and recreate'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  if git describe --long --tags 2>/dev/null | grep -q .; then
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  make -C "${pkgname}"
}

package() {
  cd "${pkgname}"

  # Install commands (exclude C source)
  local _cmd
  while IFS= read -rd '' _cmd; do
    install -Dm755 "${_cmd}" "${pkgdir}/usr/bin/${_cmd##*/}"
  done < <(find bin/ -maxdepth 1 -type f ! -name '*.c' -print0)

  # Install shared bash libraries (sourced via the bin/ scripts'
  # bootstrap; not executable).
  install -Dm644 -t "${pkgdir}/usr/lib/${pkgname%-git}/" lib/virtdev/*

  # Install ISO profile
  local _profiledir="${pkgdir}/usr/share/${pkgname%-git}/profile"

  local _file
  while IFS= read -rd '' _file; do
    install -Dm644 "${_file}" "${_profiledir}/${_file#iso/}"
  done < <(find iso/ -type f -print0)
  unset _file

  chmod 755 "${_profiledir}/airootfs/root/virtdev/install.sh"

  install -dm755 "${_profiledir}/airootfs/etc/systemd/system/multi-user.target.wants"
  ln -s ../virtdev-install.service "${_profiledir}/airootfs/etc/systemd/system/multi-user.target.wants/virtdev-install.service"

  # Install documentation
  install -Dm644 README.md  "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
  install -Dm644 DESIGN.md  "${pkgdir}/usr/share/doc/${pkgname%-git}/DESIGN.md"
  install -Dm644 LICENSE.AGPLv3 "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
