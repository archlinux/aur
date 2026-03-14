pkgname=archjh
pkgver=1.0.0
pkgrel=1
pkgdesc="Linux equivalent of HidHide - hide USB input devices from games using eBPF LSM"
arch=('x86_64')
url="https://github.com/defconxt/ArchJoyHide"
license=('GPL-2.0-only')
depends=('python' 'python-yaml' 'python-pyqt6' 'libbpf' 'bpf')
makedepends=('clang' 'bpf' 'git')
source=("git+https://github.com/defconxt/ArchJoyHide.git")
sha256sums=('SKIP')

build() {
    cd ArchJoyHide
    make
}

package() {
    cd ArchJoyHide

    # Loader binary
    install -Dm755 build/archjh-loader "$pkgdir/usr/bin/archjh-loader"

    # Python package
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -Dm644 archjh/__init__.py "$pkgdir/$site_packages/archjh/__init__.py"
    install -Dm644 archjh/core.py "$pkgdir/$site_packages/archjh/core.py"
    install -Dm644 archjh/cli.py "$pkgdir/$site_packages/archjh/cli.py"
    install -Dm644 archjh/gui.py "$pkgdir/$site_packages/archjh/gui.py"

    # CLI/GUI entry point
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/archjh" <<'SCRIPT'
#!/usr/bin/env python3
import sys
if len(sys.argv) < 2 or sys.argv[1] == "gui":
    from archjh.gui import main
    main()
else:
    from archjh.cli import main
    main()
SCRIPT

    # Apply helper
    install -Dm755 config/archjh-apply "$pkgdir/usr/bin/archjh-apply"

    # systemd service
    install -Dm644 config/archjh.service "$pkgdir/usr/lib/systemd/system/archjh.service"

    # Desktop entry
    install -Dm644 config/com.archjh.desktop "$pkgdir/usr/share/applications/com.archjh.desktop"
}
