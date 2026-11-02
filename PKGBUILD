# PKGBUILD

# Maintainer: Daniele Fucini <dfucini [at] gmail [dot] com>

pkgname=simple_backup
pkgdesc='Simple backup script that uses rsync to copy files'
pkgver=4.6.2
pkgrel=1
url="https://git.shouldnt.work/fuxino/$pkgname"
arch=('any')
license=('GPL-3.0-or-later')
makedepends=('git'
             'python-setuptools'
             'python-build'
             'python-installer')
depends=('python>=3.10'
         'rsync')
optdepends=('python-systemd: use systemd log'
            'python-dbus: for desktop notifications'
            'python-paramiko: for remote backup through ssh')
checkdepends=('python-pytest'
              'python-paramiko'
              'openssh')
conflicts=('simple_backup-git')
source=("git+$url?signed#tag=$pkgver")
validpgpkeys=('7E12BC1FF3B6EDB2CD8053EB981A2B2A3BBF5514')
sha256sums=('bbe7b79669fe02ca4dc62fb08b8b5eaed809b5f1ece9586017af8ebf20d2faa0')

build()
{
    cd "$srcdir"/"$pkgname"
    python -m build --wheel --no-isolation
}

check()
{
    cd "$srcdir"/"$pkgname"
    python -m pytest
}

package()
{
    cd "$srcdir"/"$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$pkgname"/"$pkgname".conf "$pkgdir"/usr/share/doc/"$pkgname"/"$pkgname".conf
    install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
    install -Dm644 man/"$pkgname".1 "$pkgdir"/usr/share/man/man1/"$pkgname".1
}
