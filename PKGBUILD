# Maintainer:
# Contributor: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Felix Bühler <account at buehler dot rocks>
# Contirbutor: Nils Czernia <nils[at]czserver.de>

: ${_sync_nmap:=false}

_gitname="nmap"
_pkgname="zenmap"
pkgname="$_pkgname"
pkgver=7.97
pkgrel=2
pkgdesc="Graphical Nmap frontend and results viewer"
url='https://github.com/nmap/nmap'
license=('LicenseRef-Nmap-Public-Source-License-Version-0.95')
arch=('any')

depends=(
  'gtk3'
  'nmap'
  'python'
  'python-cairo'
  'python-gobject'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'pkexec: start zenmap as root'
)

if [[ "${_sync_nmap::1}" == "t" ]]; then
  _pkgver="$(LC_ALL=C pacman -Si extra/nmap | grep -Pom1 '^Version\s+:\s+\K\S+(?=-[0-9])')"
else
  _pkgver="$pkgver"
fi

_pkgsrc="$_gitname-$_pkgver"
_pkgext="tar.bz2"
source=(
  "$_pkgsrc.$_pkgext"::"https://nmap.org/dist/$_pkgsrc.$_pkgext"
  "$_pkgsrc.$_pkgext.asc"::"https://nmap.org/dist/sigs/$_pkgsrc.$_pkgext.asc"
)
sha256sums=(
  'SKIP'
  'SKIP'
)
validpgpkeys=(
  '436D66AB9A798425FDA0E3F801AF9F036B9355D0' # Nmap Project Signing Key (http://www.insecure.org/)
)

prepare() {
  # use pkexec for root
  sed -E \
    -e 's@^(\s*)(if which gksu.*)$@\1if which pkexec >/dev/null 2>\&1; then\n\1  SU_TO_ROOT_X=pkexec\n\1el\2@' \
    -e '/gksu\)/i \      pkexec) pkexec "\$COMMAND";;' \
    -i "$_pkgsrc/zenmap/install_scripts/unix/su-to-zenmap.sh"
}

pkgver() {
  echo "${_pkgver:?}"
}

build() {
  cd "$_pkgsrc/zenmap"
  python -m build --no-isolation --wheel
}

package() {
  cd "$_pkgsrc"
  install -Dm644 "docs/zenmap.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  cd "zenmap"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # icon
  install -Dm644 "zenmapCore/data/pixmaps/zenmap.png" -t "$pkgdir/usr/share/pixmaps/"

  cd "install_scripts/unix"
  install -Dm755 "su-to-zenmap.sh" -t "$pkgdir/usr/bin/"
  install -Dm644 "zenmap.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "zenmap-root.desktop" -t "$pkgdir/usr/share/applications/"

  ln -s zenmap "$pkgdir/usr/bin/nmapfe"
  ln -s zenmap "$pkgdir/usr/bin/xnmap"

  # polkit policy
  install -Dm644 /dev/stdin "$pkgdir/usr/share/polkit-1/actions/org.gnome.pkexec.zenmap.policy" << END
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE policyconfig PUBLIC
  "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN"
  "http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd">
<policyconfig>
  <action id="com.gnome.pkexec.zenmap">
    <message gettext-domain="zenmap">Authentication is required to run zenmap</message>
    <icon_name>zenmap</icon_name>
    <defaults>
      <allow_any>auth_admin</allow_any>
      <allow_inactive>auth_admin</allow_inactive>
      <allow_active>auth_admin</allow_active>
    </defaults>
    <annotate key="org.freedesktop.policykit.exec.path">/usr/bin/zenmap</annotate>
    <annotate key="org.freedesktop.policykit.exec.allow_gui">true</annotate>
  </action>
</policyconfig>
END
}
