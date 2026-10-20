# Maintainer: lucas007 <lucas007@localhost>
pkgname=amdgpu-fan-ctl-tyan-s8030gm2ne
pkgver=1.0.0
pkgrel=1
pkgdesc="AMD GPU temperature driven fan control for Tyan S8030GM2NE via local ipmitool"
arch=('any')
url="https://aur.archlinux.org/packages/$pkgname"
license=('custom')  # 上游未提供 LICENSE，暂用 custom
depends=('python>=3.11' 'ipmitool' 'rocm-smi-lib')
backup=('etc/gpu-fan-ctl/config.toml')
source=("gpu_fan_ctl.py" "config.toml" "gpu-fan-ctl.service" "README.md" "test_gpu_fan_ctl.py")
sha256sums=(
  '341e9fb2cfc5958271977eef5ff3c31a6cdfd50f564129a464b5ffaf3d3e2b81'
  'ef5788e89e4ee31f0aca546ed5de4e32ae6897ae5365bd7690850fcb8ea016cf'
  'eeb73d5ecd53a636e38d0fa95933234feec3af031736a72def33e98a049a2683'
  '7894b710251a403d9cb35fbd938b3c4a7d7e652fb863f83bbd797440c7f2eda4'
  '54cad3f1f5f5c9ae5192262a3bf0728b5f8f773a756dba56009ca41177ce129c'
)

check() {
  cd "$srcdir"
  python3 -m unittest -q test_gpu_fan_ctl
}

package() {
  install -Dm755 "$srcdir/gpu_fan_ctl.py" "$pkgdir/usr/lib/$pkgname/gpu_fan_ctl.py"
  install -Dm644 "$srcdir/config.toml" "$pkgdir/etc/gpu-fan-ctl/config.toml"
  install -Dm644 "$srcdir/gpu-fan-ctl.service" "$pkgdir/usr/lib/systemd/system/gpu-fan-ctl.service"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/test_gpu_fan_ctl.py" "$pkgdir/usr/share/doc/$pkgname/test_gpu_fan_ctl.py"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/gpu_fan_ctl.py" "$pkgdir/usr/bin/gpu-fan-ctl"
}
