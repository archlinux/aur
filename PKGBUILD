# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('atoms' 'atoms-cli' 'atoms-core' 'servicectl-atoms')
pkgbase=atoms
pkgver=1.1.0
pkgrel=1
pkgdesc="Easily manage Linux Chroot(s) and Containers"
arch=('any')
url="https://github.com/AtomsDevs/Atoms"
license=('GPL3')
depends=('libadwaita' 'podman' 'proot-termux' 'python-certifi' 'python-chardet'
         'python-gobject' 'python-idna' 'python-orjson' 'python-requests'
         'python-tabulate' 'python-uproot' 'python-urllib3' 'vte4')
makedepends=('git' 'meson' 'python-build' 'python-installer' 'python-setuptools'
             'python-wheel')
checkdepends=('appstream-glib')
_commit=36315140b2ce5667878173f61254a20d4b5b567b  # tags/1.1.0^0
source=("git+https://github.com/AtomsDevs/Atoms.git#commit=${_commit}"
        'git+https://github.com/AtomsDevs/atoms-cli.git'
        'git+https://github.com/AtomsDevs/atoms-core.git'
        'git+https://github.com/AtomsDevs/servicectl.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/Atoms"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$srcdir/Atoms"
  git submodule init
  git config submodule.atoms-cli.url "$srcdir/atoms-cli"
  git config submodule.atoms-core.url "$srcdir/atoms-core"
  git config submodule.servicectl.url "$srcdir/servicectl"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson Atoms build
  meson compile -C build

  cd "$srcdir/Atoms/$pkgbase-cli"
  python -m build --wheel --no-isolation

  cd "$srcdir/Atoms/$pkgbase-core"
  python -m build --wheel --no-isolation
}

check() {
  meson test -C build --print-errorlogs || :
}

package_atoms() {
  depends=('atoms-cli' 'libadwaita' 'podman' 'proot-termux' 'python-certifi'
           'python-chardet' 'python-gobject' 'python-idna' 'python-uproot'
           'python-urllib3' 'servicectl-atoms' 'vte4')
  optdepends=('distrobox: List and handle Distrobox containers as atoms')

  meson install -C build --destdir "$pkgdir"
}

package_atoms-cli() {
  pkgdesc="Allows you to create and manage your atoms via the command line."
  url="https://github.com/AtomsDevs/atoms-cli"
  depends=('atoms-core' 'python-tabulate')

  cd "$srcdir/Atoms/$pkgbase-cli"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_atoms-core() {
  pkgdesc="Allows you to create and manage your own chroots and podman containers."
  url="https://github.com/AtomsDevs/atoms-core"
  depends=('python-orjson' 'python-requests')

  cd "$srcdir/Atoms/$pkgbase-core"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_servicectl-atoms() {
  pkgdesc="Control services (daemons) for systemd in chroot environment (POSIX compliant fork)"
  url="https://github.com/AtomsDevs/servicectl"
  license=('MIT')
  depends=('systemd')
  provides=('servicectl')
  conflicts=('servicectl')

  cd "$srcdir/Atoms/servicectl"
  install -d "$pkgdir/usr/lib/servicectl/enabled"
  install -m755 servicectl -t "$pkgdir/usr/lib/servicectl/"
  install -m755 serviced -t "$pkgdir/usr/lib/servicectl/"
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/servicectl/servicectl" "${pkgdir}/usr/bin/"
  ln -s "/usr/lib/servicectl/serviced" "${pkgdir}/usr/bin/"
}
