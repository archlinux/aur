# Maintainer: gradia <gradia@disroot.org>
# PKGBUILD per klamav-py (https://github.com/gradia64/KlamAV-Py)
#
# AUR: build dal tag firmato della release, verificato da makepkg
# contro validpgpkeys (source qui sotto). Prima installazione:
#   gpg --recv-keys EBEE3E80EFA38B42B147F1B99D7AA4F1971FEAA9
# e confrontare l'impronta con quella nel README.
# Test locale senza macchina Arch:  arch/test-local.sh   (docker)
# Build locale su una macchina Arch: arch/test-local.sh --tarball
#   (stampa i comandi; serve il tarball perché un source git clona
#   solo ciò che è già committato, e il tag comunque non include le
#   modifiche non ancora rilasciate)

pkgname=klamav-py
pkgver=0.1.10
pkgrel=1
pkgdesc="Frontend Python minimale per ClamAV via clamd, erede spirituale di KlamAV 0.22"
arch=('any')
url="https://github.com/gradia64/KlamAV-Py"
license=('GPL-3.0-or-later')
depends=('python>=3.10')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=(
  'pyside6: GUI (klamav-py-gui)'
  'clamav: demone clamd, richiesto per la scansione'
  'polkit: aggiornamento database virus da GUI (pkexec systemctl restart del servizio freshclam)'
  'kio: integrazione menu contestuale Dolphin (kbuildsycoca)'
  'libnotify: notifica desktop se la scansione programmata trova infezioni o fallisce'
)
install=klamav-py.install
# Sorgente git invece dell'archivio di GitHub: l'archivio non è firmato,
# il tag sì. Con "?signed" makepkg verifica la firma del tag annotato e
# la accetta solo se fatta da una chiave in validpgpkeys.
# Il prefisso "$pkgname::" fissa la directory del clone in $srcdir/klamav-py.
# Aggiornare pkgver a ogni rilascio, insieme a klamav_py/__init__.py,
# debian/changelog e CHANGELOG.md (tests/test_changelog.py lo verifica).
# Il tag v$pkgver deve essere già firmato e pubblicato su GitHub.
source=("$pkgname::git+$url.git#tag=v$pkgver?signed")
# SKIP: l'integrità è garantita dalla firma del tag. Con pacman recente
# provare "makepkg -g": se restituisce un hash reale anche per il
# sorgente git, usarlo qui al posto di SKIP (firma + checksum).
sha256sums=('SKIP')
# Impronta della chiave primaria: makepkg accetta anche le firme delle
# sue sottochiavi, quindi la rotazione della sottochiave di firma non
# richiede modifiche qui.
validpgpkeys=('EBEE3E80EFA38B42B147F1B99D7AA4F1971FEAA9') # gradia (KlamAV-Py release signing)

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
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

  # Man page: l'inglese in man1, l'italiano in it/man1 con lo stesso nome
  # (man sceglie in base alla locale). La compressione la fa makepkg.
  local page
  for page in klamav-py klamav-py-gui; do
    install -Dm644 "docs/man/$page.1" \
      "$pkgdir/usr/share/man/man1/$page.1"
    install -Dm644 "docs/man/$page.it.1" \
      "$pkgdir/usr/share/man/it/man1/$page.1"
  done
}
