_gitname="Sonarr"
_gitver="2.0.0"
_gitbranch="develop"

# NB: Only for pull requests in origin
_git_patches=""
_git_patches+="783:mono-process-name "

pkgname="sonarr-git"
pkgver=2.0.0.r6635
pkgrel=1
pkgdesc="Automated TV series manager and downloader - git branch ${_gitbranch}"
arch=(any)
url="https://sonarr.tv"
license=('GPL3')
groups=()
depends=('mono'
         'libmediainfo'
         'sqlite')
makedepends=('git'
             'npm'
             'nodejs')
optdepends=()
provides=('sonarr')
conflicts=('sonarr'
           'sonarr-develop')
replaces=()
backup=()
options=('!strip')
install='sonarr.install'
changelog=
source=("git://github.com/Sonarr/Sonarr.git#branch=${_gitbranch}"
        "sonarr.sh"
        "sonarr.service"
        "sonarr.install")
sha256sums=('SKIP'
            'd594c4d5ad3c1b196a00cb9f005d4917ad4d8bb2ebf501010e8be7f349b3caa6'
            '1ebf903e6199dae6032c7839b00ed20566404daf87cb307ffc9ee8539722a845'
            '7e9c1c5b5114355f4016b8c248975af19dbe40be086c1d4a555b61aac3386169')


pkgver() {
  cd "${_gitname}"

  printf "${_gitver}.r%s" "$(git rev-list --count ${_gitbranch})"
}

prepare() {
  cd "${_gitname}"

  # Install necessary nodejs libraries
  npm install

  # Git complains if user is not already set
  [[ `git config user.email` ]] || git config user.email "you@example.com"
  [[ `git config user.name` ]] || git config user.name "Your Name"

  for patch in ${_git_patches}; do
      id=`echo ${patch} | cut -d \: -f 1`
      name=`echo ${patch} | cut -d \: -f 2`
      msg2 "Patching ${name} from (https://github.com/Sonarr/Sonarr/pull/${id}"
      git fetch origin pull/${id}/head:${name} --force
      git rebase ${name} --force-rebase --ignore-whitespace --quiet
  done

  git submodule update --init
}

build() {
  cd "${_gitname}"

  export MONO_IOMAP=case
  xbuild ./src/NzbDrone.sln /t:Configuration=Release /t:Build

  node ./node_modules/gulp/bin/gulp.js build
}

package() {
  find "${_gitname}/_output/" \( \
        -name "ServiceUninstall.*" \
     -o -name "ServiceInstall.*" \
     -o -name "sqlite3.*" \
     -o -name "MediaInfo.*" \
     -o -name "NzbDrone.Windows.*" \
   \) -type f -delete

  install -d "${pkgdir}/var/lib/sonarr"

  install -Dm755 "sonarr.sh" "${pkgdir}/usr/bin/sonarr"
  install -Dm644 "sonarr.service" "${pkgdir}/usr/lib/systemd/system/sonarr.service"

  install -d "${pkgdir}/opt/sonarr"
  cp -a "${_gitname}/_output/"* "${pkgdir}/opt/sonarr"
  find "${pkgdir}/opt/sonarr" -type d -exec chmod 755 {} \;
  find "${pkgdir}/opt/sonarr" -type f -exec chmod 644 {} \;
  find "${pkgdir}/opt/sonarr" -name \*.exe -type f -exec chmod 755 {} \;
}
