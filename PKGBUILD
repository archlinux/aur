# Maintainer: gradia <gradia@disroot.org>
# PKGBUILD per klamav-py (https://github.com/gradia64/KlamAV-Py)
#
# AUR: build dal tag GitHub della release (source qui sotto).
# Test locale senza macchina Arch:  arch/test-local.sh   (docker)
# Build locale su una macchina Arch: arch/test-local.sh --tarball
#   (stampa i comandi; serve il tarball perché un source git clona
#   solo ciò che è già committato, e il tag comunque non include le
#   modifiche non ancora rilasciate)

pkgname=klamav-py
pkgver=0.1.9
pkgrel=1
pkgdesc="Frontend Python minimale per ClamAV via clamd, erede spirituale di KlamAV 0.22"
arch=('any')
url="https://github.com/gradia64/KlamAV-Py"
license=('GPL-3.0-or-later')
depends=('python>=3.10')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=(
  'pyside6: GUI (klamav-py-gui)'
  'clamav: demone clamd, richiesto per la scansione'
  'polkit: aggiornamento database virus da GUI (pkexec systemctl restart del servizio freshclam)'
  'kio: integrazione menu contestuale Dolphin (kbuildsycoca)'
  'libnotify: notifica desktop se la scansione programmata trova infezioni o fallisce'
)
install=klamav-py.install
# L'archivio del tag GitHub si estrae in KlamAV-Py-<versione>: GitHub
# toglie la "v" iniziale dal nome della directory, ma non dal tag, da
# cui il "v$pkgver" nell'URL e il "$pkgver" nel cd di build/package.
# Il prefisso "$pkgname-$pkgver.tar.gz::" evita che il file scaricato si
# chiami "v0.1.6.tar.gz" e collida in SRCDEST con altri pacchetti.
# Aggiornare pkgver a ogni rilascio, insieme a klamav_py/__init__.py,
# debian/changelog e CHANGELOG.md (tests/test_changelog.py lo verifica).
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d7415e3376e2006538e66771fa612608fa8ec92a2c2b9e69a1a38afc7b139ced')

build() {
  cd "$srcdir/KlamAV-Py-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/KlamAV-Py-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Desktop entry e icona (stessi file del pacchetto .deb)
  install -Dm644 debian/klamav-py.desktop \
    "$pkgdir/usr/share/applications/klamav-py.desktop"
  install -Dm644 klamav_py/gui/resources/klamav-py.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/klamav-py.svg"

  # Unit systemd utente per la scansione programmata: sorgente unica in
  # debian/, condivisa con il .deb. Su Arch non si abilitano in fase di
  # install, l'hint viene stampato da klamav-py.install.
  # klamav-scan-notify.service è static (niente [Install]): la attiva solo
  # OnFailure= di klamav-scan.service.
  install -Dm644 debian/klamav-py.klamav-scan.user.service \
    "$pkgdir/usr/lib/systemd/user/klamav-scan.service"
  install -Dm644 debian/klamav-py.klamav-scan.user.timer \
    "$pkgdir/usr/lib/systemd/user/klamav-scan.timer"
  install -Dm644 debian/klamav-py.klamav-scan-notify.user.service \
    "$pkgdir/usr/lib/systemd/user/klamav-scan-notify.service"
}
