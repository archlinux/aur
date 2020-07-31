# Maintainer: Amin Vakil <info at aminvakil dot com>

_pkgname=tsunami-security-scanner-plugins
pkgname=google-tsunami-security-scanner-plugins-git
pkgver=r28.2d44661
pkgrel=1
pkgdesc="A central repository for many useful Tsunami Security Scanner plugins"
arch=(any)
url="https://github.com/google/tsunami-security-scanner-plugins"
license=('Apache')
makedepends=('git')
depends=('java-runtime') 
source=("git+${url}.git")

sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    for plugin_dir in $(find ${srcdir} -name 'gradlew' -print0 | xargs -0 -n1 dirname | sort --unique) ; do
      plugin_name="${plugin_dir##*"${srcdir}/"}"
      printf "\nBuilding ${plugin_name} ...\n"
    
      pushd "${plugin_dir}" >/dev/null
    
      ./gradlew build
    
      popd >/dev/null
    done
}
package() {
    appdir="${pkgdir}/opt/${_pkgname}"
    mkdir -p "${appdir}"
    readarray -d '' jar < <(find "${srcdir}" -name '*.jar' -print0)
    for jar_path in "${jar[@]}" ; do
      jar_filename="${jar_path##*/}"
      install ${jar_path} "${appdir}/${jar_filename}"
    done
}

