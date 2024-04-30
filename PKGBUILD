# Maintainer: Xuanrui Qi <xuanrui@xuanruiwork>
pkgbase=rebuild-initramfs-dracut
pkgname=(rebuild-initramfs-dracut rebuild-initramfs-dracut-hook)
pkgver=2.1.1
pkgrel=1
arch=('any')
url="https://github.com/xuanruiqi/rebuild-initramfs-dracut-arch"
license=('MIT')
makedepends=("ruby-ronn-ng"
             "python-installer"
             "python-build"
             "python-setuptools"
             "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xuanruiqi/${pkgname}-arch/archive/${pkgver}.tar.gz")
sha256sums=('d377dad9c810a76dff4afe1028fe848c146b71eb37562c7188f2e6543d0e1468')

build() {
  cd "${srcdir}/${pkgbase}-arch-${pkgver}"
  python -m build --wheel --no-isolation
  ronn man.md
}

package_rebuild-initramfs-dracut() {
  pkgdesc="A helper script to rebuild initramfs images using dracut"
  depends=("dracut"
           "pyalpm"
           "python-termcolor"
           "python-yaml")
  optdepends=("sbsigntools: to sign kernel image")
  conflicts=("rebuild-initramfs-dracut-legacy")
  backup=("etc/rebuild-initramfs.yaml")

  cd "${srcdir}/${pkgbase}-arch-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 rebuild-initramfs.yaml "${pkgdir}/etc/rebuild-initramfs.yaml"
  install -Dm644 man.1 "${pkgdir}/usr/share/man/man1/rebuild-initramfs.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_rebuild-initramfs-dracut-hook() {
  pkgdesc="Install/remove hooks for dracut, based on rebuild-initramfs"
  depends=("rebuild-initramfs-dracut")
  conflicts=("rebuild-initramfs-dracut-legacy-hook")

  cd "${srcdir}/${pkgbase}-arch-${pkgver}"

  install -Dm755 hooks/scripts/rebuild-initramfs-install "${pkgdir}/usr/share/libalpm/scripts/rebuild-initramfs-install"
  install -Dm755 hooks/scripts/rebuild-initramfs-remove "${pkgdir}/usr/share/libalpm/scripts/rebuild-initramfs-remove"
  install -Dm644 hooks/90-rebuild-initramfs-install.hook "${pkgdir}/usr/share/libalpm/hooks/90-rebuild-initramfs-install.hook"
  install -Dm644 hooks/60-rebuild-initramfs-remove.hook "${pkgdir}/usr/share/libalpm/hooks/60-rebuild-initramfs-remove.hook"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
