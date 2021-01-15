# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-packages3d-git
_gitlab_repo=kicad/libraries/kicad-packages3D
pkgver=20201014.0.1602698909
pkgrel=1
pkgdesc="KiCad component 3D model libraries from the official git repo"
arch=('any')
url=https://gitlab.com/${_gitlab_repo}
license=('GPL')
options=('!strip')
makedepends=(
cmake
git
ninja
jq
curl
)
conflicts=('kicad-library-bzr' 'kicad-library-git' 'kicad-library-3d' 'kicad-library' 'kicad-packages' 'kicad-packages3d')
provides=('kicad-packages3d')
source=()

# do a shallow clone because the whole history here is annoying
prepare(){
  if [ -d $(basename ${_gitlab_repo}) ]; then
    cd $(basename ${_gitlab_repo})
    git fetch --depth 1
    git checkout master
  else
    git clone --depth 1 https://gitlab.com/${_gitlab_repo}.git
  fi
}

pkgver() {
  cd $(basename ${_gitlab_repo})
  # since we did a shallow clone in prepare, we need to find a way to version this...
  local _gitlab_repo_id=$(printf "${_gitlab_repo}" | jq -sRr @uri)
  local _latest_commit_timestamp=$(curl -s "https://gitlab.com/api/v4/projects/${_gitlab_repo_id}/repository/commits" | jq -r '.[0]["created_at"]')

  local _version_day=$(date --date=${_latest_commit_timestamp} +'%Y%m%d')
  local _version_epoch=$(date --date=${_latest_commit_timestamp} +"%s")
  
  # notes for github repos
  #_num_commits=$(curl -s -H "Accept: application/vnd.github.v3+json" "https://api.github.com/repos/octocat/hello-world/stats/code_frequency" | jq -r '. | length')
  
  printf "%s.0.%s" "${_version_day}" "${_version_epoch}"
}

build() {
  cd $(basename ${_gitlab_repo})
  cmake \
    -B "${srcdir}"/build_dir \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -G Ninja \
    -S .

  cmake --build "${srcdir}"/build_dir
}

package() {
  cd $(basename ${_gitlab_repo})
  DESTDIR="${pkgdir}" cmake --build "${srcdir}/build_dir" -- install

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.md
}

