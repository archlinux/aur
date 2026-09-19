# Maintainer: Keith Vassallo <keith@vassallo.cloud>
#
# Template. `just aur` / `just aur-publish` render this into a real PKGBUILD,
# substituting 0.2.0 and bab544be8dbfdd82e11bba39b08caa8741f2efbf9fbda51cb2017d0254c662a0 from the published GitHub release.
# Edit this file, never the generated one.
#
# This repackages the official .deb rather than building from source, so the
# launcher, the .desktop file and the hicolor icon are the same files every
# other Linux user gets, with nothing to keep in sync by hand. The .deb carries
# no interpreter and nothing compiled — DigiMem is pure Python living in
# /usr/lib/digimem, with a wrapper that puts it back on the path — which is why
# this is arch=('any'), and why a Python upgrade cannot strand it the way an
# installation into site-packages would.
pkgname=digimem-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Two-way face sync between digiKam and Nextcloud Memories"
arch=('any')
url="https://github.com/keithvassallomt/digikam-memories-sync"
license=('GPL-3.0-or-later')
# The window is served to the user's own browser, so there is no toolkit here:
# yaml is read at startup, psutil is how the background service finds and stops
# itself, and keyring is where the Nextcloud app password goes.
depends=('python' 'python-yaml' 'python-psutil' 'python-keyring' 'hicolor-icon-theme')
# A digiKam library on SQLite needs none of these, and that is most of them.
optdepends=(
    'python-pymysql: digiKam libraries kept in MySQL or MariaDB'
    'python-psycopg2: digiKam libraries kept in PostgreSQL'
    'openssh: reaching a remote digiKam or Nextcloud database over an SSH tunnel'
    'gnome-keyring: somewhere to keep the Nextcloud app password other than a file'
)
provides=("digimem=${pkgver}")
conflicts=('digimem')
options=('!strip' '!debug')
source=("digimem_${pkgver}_all.deb::${url}/releases/download/v${pkgver}/digimem_${pkgver}_all.deb")
sha256sums=('bab544be8dbfdd82e11bba39b08caa8741f2efbf9fbda51cb2017d0254c662a0')

package() {
    # Match data.tar.* by glob so a future nfpm switching gzip for xz or zst
    # keeps working; the inner bsdtar detects the compression itself.
    bsdtar -O -xf "digimem_${pkgver}_all.deb" 'data.tar.*' | bsdtar -C "${pkgdir}" -xf -
}
