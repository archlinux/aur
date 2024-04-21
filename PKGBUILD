# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=grub-reboot-picker
_app_id=com.mendhak.grubrebootpicker
pkgver=0.0.8
pkgrel=2
pkgdesc="Tray application to reboot into different OSes or UEFI/BIOS"
arch=('any')
url="https://github.com/mendhak/grub-reboot-picker"
license=('MIT')
depends=('grub' 'libappindicator-gtk3' 'polkit' 'python-cairo' 'python-gobject')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'setup.patch'
        'un-reboot.png')  # from Ubuntu update-notifier package
sha256sums=('9a18eb1696f98f36d3e1887dc08f19634afc1409844edaaba6b0a80f86d8a2e9'
            '53697a6925981cf83c3c67fed1646fff9a3800ce43994f7da94526151b285bb2'
            'd764a1b0722752b5166529838f29cfa5b708554d209fc4206e8f7f846e8a51cf')

prepare() {
  cd "$pkgname-$pkgver"

  # We don't need stdeb
  patch --verbose -p0 < "$srcdir/setup.patch"

  # sbin to bin
  for f in "${_app_id}.desktop" "${_app_id}.policy"; do
    sed -i 's/sbin/bin/g' "${f}"
  done

  if [[ -d "$pkgname" ]]; then
    rm -rf "$pkgname"
  fi
  mv src "$pkgname"
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  mv -v "${pkgdir}${site_packages}"/etc "$pkgdir/"
  cp -rv "${pkgdir}${site_packages}"/usr/* "$pkgdir/usr/"
  rm -rfv "${pkgdir}${site_packages}/usr"

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/un-reboot.png" -t "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
}
