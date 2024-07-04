# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Jacob McSwain (https://aur.archlinux.org/account/USA-RedDragon)
pkgname=cuttlefish-base-git
epoch=1
pkgver=r6181.20240702.8b6907327
pkgrel=1
pkgdesc="Cuttlefish Android Virtual Device companion package contains set of tools and binaries required to boot up and manage Cuttlefish Android Virtual Device that are used in all deployments."
arch=(any)
license=(Apache)
url="https://github.com/google/android-cuttlefish"
makedepends=("git")
depends=(
    "dnsmasq"
    "python"
)
provides=(
  "${pkgname%-git}"
)
conflicts=(
  "${pkgname%-git}"
)
source=(
  "${pkgname%-git}::git+https://github.com/google/android-cuttlefish.git"
  "0001-Fixup-init.d-service-to-be-used-in-usr-bin-for-syste.patch"
  "cuttlefish-host-resources.service"
  "cuttlefish-base.install"
)
backup=(
  'etc/default/cuttlefish-host-resources'
  'etc/modules-load.d/cuttlefish-common.conf'
)
sha256sums=(
  'SKIP'
  'd7dab4e9ab06113793dce431654a825e934dc10d304ed6a4b95abfdd8f5cf82f'
  '910b61c6437d22f44171a8abd2522cddbfa99c66e54e2ab619237c48e654f259'
  'd280c00f37ba6876d87025d0e84ac4b8188e30871925a5cd3015e10df32828a0'
)
install="cuttlefish-base.install"

prepare() {
  cd "$srcdir/${pkgname%-git}"

  patch base/debian/cuttlefish-base.cuttlefish-host-resources.init < "${srcdir}"/0001-Fixup-init.d-service-to-be-used-in-usr-bin-for-syste.patch
  git log > git.log
}

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Could not determine git commit count."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

package() {
  install -Dm0644 "${srcdir}/cuttlefish-host-resources.service" "$pkgdir/usr/lib/systemd/system/cuttlefish-host-resources.service"

  cd "$srcdir/${pkgname%-git}"

  install -Dvm0644 base/debian/cuttlefish-base.cuttlefish-host-resources.default "$pkgdir/etc/default/cuttlefish-host-resources"
  install -Dvm0755 base/debian/cuttlefish-base.cuttlefish-host-resources.init "$pkgdir/usr/bin/cuttlefish-host-resources"
  install -Dvm0644 base/debian/cuttlefish-base.udev "$pkgdir/usr/lib/udev/rules.d/60-cuttlefish-base.rules"

  install -Dvm0644 base/host/packages/cuttlefish-base/etc/modules-load.d/cuttlefish-common.conf "$pkgdir/etc/modules-load.d/cuttlefish-common.conf"

  install -Dvm0755 base/host/deploy/install_zip.sh "$pkgdir/usr/bin/install_zip.sh"
  install -Dvm0755 base/host/deploy/capability_query.py "$pkgdir/usr/lib/cuttlefish-common/bin/capability_query.py"
  install -Dvm0755 base/host/deploy/unpack_boot_image.py "$pkgdir/usr/lib/cuttlefish-common/bin/unpack_boot_image.py"

  install -Dvm0644 base/debian/copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE-debian"
  install -dvm0755 "$pkgdir/usr/share/doc/$_pkgname"
  ln -svr "$pkgdir/usr/share/licenses/$pkgname/LICENSE-debian" "$pkgdir/usr/share/doc/$_pkgname/LICENSE-debian"
  install -Dvm0644 base/debian/changelog "$pkgdir/usr/share/doc/$_pkgname/changelog-debian"

  for _docfile in CONTRIBUTING.md README.md git.log; do
    install -Dvm0644 "${_docfile}" "${pkgdir}/usr/share/doc/${pkgname%-git}/${_docfile}"
  done
  for _licensefile in LICENSE; do
    install -Dvm0644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${pkgname%-git}/$(basename "${_licensefile}")"
  done
}

# vim: ft=sh:ts=4:sw=4:et:nowrap
