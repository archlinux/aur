_gitname="Sonarr"
_gitver="2.0.0"
_gitbranch="develop"
pkgname="sonarr-git"
pkgver=2.0.0.r6043
pkgrel=1
pkgdesc="Smart PVR for newsgroup and bittorrent users"
arch=(any)
url="https://sonarr.tv"
license=('GPL3')
depends=('mono' 'libmediainfo' 'sqlite')
makedepends=('git' 'nodejs')
install='sonarr.install'
provides=('sonarr')
conflicts=('sonarr' 'sonarr-develop')
options=('!strip')
source=("git://github.com/Sonarr/Sonarr.git#branch=${_gitbranch}"
        "sonarr.sh"
        "sonarr.service"
        "sonarr.install")
md5sums=(SKIP
         SKIP
         SKIP
         SKIP)

pkgver() {
  cd "${_gitname}"

  # FIXME May deviate from actual version
  printf "${_gitver}.r%s" "$(git rev-list --count HEAD)"
}

build() {
  cd "${_gitname}"

  npm install
  fakeroot mozroots --import --machine --sync
  MONO_IOMAP=case xbuild src/NzbDrone.sln /t:Configuration=Release /t:Build
  node node_modules/gulp/bin/gulp.js build
}

package() {
  msg2 "Remove native Windows binaries"
  find "${_gitname}/_output/" \( \
        -name "ServiceUninstall.*" \
     -o -name "ServiceInstall.*" \
     -o -name "sqlite3.*" \
     -o -name "MediaInfo.*" \
     -o -name "NzbDrone.Windows.*" \
   \) -type f -delete

  msg2 "Replacing main executable with console variant"
  mv -f "${_gitname}/_output/NzbDrone.Console.exe" "${_gitname}/_output/NzbDrone.exe"

  install -d -m 755 "${pkgdir}/var/lib/sonarr"

  msg2 "Install Sonarr in /usr/lib"
  install -d -m 755 "${pkgdir}/usr/lib"
  mv -f "${_gitname}/_output/" "${pkgdir}/usr/lib/sonarr/"
  
  msg2 "Install executable into /usr/bin"
  install -D -m755 "${srcdir}/sonarr.sh" "${pkgdir}/usr/bin/sonarr"
  
  msg2 "Install sonarr.service"
  install -D -m 644 "${srcdir}/sonarr.service" "${pkgdir}/usr/lib/systemd/system/sonarr.service"
}
