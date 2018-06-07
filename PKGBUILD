# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Andrew Wright <andreww@photism.org>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>
# Contributor: Marco Crosio <marco.crosio@gmail.com>

# Set packages you want built to 1
# If no packages are selected, build java by default
# If more than 1 package is selected, create an eclipse-common-devel package
_build_java=1
_build_cpp=1
_build_jee=1
_build_php=1
_build_javascript=1

pkgbase=eclipse-devel
pkgname=()
[[ "${_build_cpp}" == '1' ]]        && pkgname+=('eclipse-cpp-devel')
[[ "${_build_jee}" == '1' ]]        && pkgname+=('eclipse-jee-devel')
[[ "${_build_php}" == '1' ]]        && pkgname+=('eclipse-php-devel')
[[ "${_build_javascript}" == '1' ]] && pkgname+=('eclipse-javascript-devel')
# If no packages are selected, build java by default
[[ "${_build_java}" == '1' || ${#pkgname[@]} -eq 0 ]] && pkgname+=('eclipse-java-devel')
# If we're building more than one package, create a common package
[[ ${#pkgname[@]} -gt 1 ]] && pkgname=('eclipse-common-devel' "${pkgname[@]}")

epoch=1
_milestone=RC2
pkgver=4.8.0${_milestone}
pkgrel=1
_release=photon-${_milestone}
pkgdesc="Highly extensible IDE"
license=(EPL)
arch=(i686 x86_64)
url="https://eclipse.org"
makedepends=()
[[ ${#pkgname[@]} -gt 1 ]] && makedepends+=('python')
options=(!emptydirs)
source=(commonify eclipse.sh eclipse.desktop)
source_i686=()
source_x86_64=()
noextract=()

for _pkg in ${pkgname[@]/-devel/}; do
  [[ $_pkg == 'eclipse-common' ]] && continue
  source_i686+=(http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/technology/epp/downloads/release/${_release/-//}/$_pkg-${_release/\./-}-linux-gtk.tar.gz)
  source_x86_64+=(http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/technology/epp/downloads/release/${_release/-//}/$_pkg-${_release/\./-}-linux-gtk-x86_64.tar.gz)
  noextract+=($_pkg-${_release/\./-}-linux-gtk{,-x86_64}.tar.gz)
  eval "package_${_pkg}-devel() { _package $_pkg; }"
done

sha256sums=('a5a5cb8a8b86bd8bb98692c4553abd84592aac2438621d8273c43715a115e2ac'
            '7f0c352f8593774838d96c213293de6d00fb6d71becce8d4ff6209bb8c58e8f6'
            'be491b305ee6d5fd4a94db4d2b31a5fbc69539e3f97094ffc35246e104deea17')
sha1sums_i686=()
sha1sums_x86_64=()

for _file in "${source_i686[@]}" ; do
	sha1sums_i686+=( $( curl -s "${_file}".sha1 | cut -f1 -d' ' ) )
done

for _file in "${source_x86_64[@]}" ; do
	sha1sums_x86_64+=( $( curl -s "${_file}".sha1 | cut -f1 -d' ' ) )
done

prepare() {

  [[ ${#pkgname[@]} -gt 1 ]] && mkdir eclipse-common

  for _pkg in ${pkgname[@]/-devel/}; do
    [[ $_pkg == 'eclipse-common' ]] && continue

    if [[ $CARCH == x86_64 ]]; then
      bsdtar -xf "$_pkg-${_release/\./-}-linux-gtk-x86_64.tar.gz"
    else
      bsdtar -xf "$_pkg-${_release/\./-}-linux-gtk.tar.gz"
    fi

    mv eclipse $_pkg
  done
}

build() {
  if [[ ${#pkgname[@]} -gt 1 ]] ; then
    ./commonify ${pkgname[@]/-devel/}

    mkdir -p eclipse-common/dropins
    touch eclipse-common/dropins/.keep
  else
    touch ${pkgname[0]%%-devel}/dropins/.keep
  fi
}

_package_files() {
  install -Dm755 eclipse.sh "$pkgdir/usr/bin/eclipse-devel"
  install -Dm644 eclipse.desktop "$pkgdir/usr/share/applications/eclipse-devel.desktop"

  for _i in 16 32 48 256; do
    install -Dm644 "$1"/plugins/org.eclipse.platform_*/eclipse${_i}.png \
      "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/eclipse-devel.png"
  done
}

package_eclipse-common-devel() {
  pkgdesc+=" (common files) Development Version"
  depends=("java-environment>=8" webkit2gtk unzip)
  provides=("eclipse-common=$pkgver-$pkgrel" "eclipse-common-devel=$pkgver-$pkgrel")

  install -d "$pkgdir/opt"
  cp -a eclipse-common "$pkgdir/opt/eclipse-devel"

  _package_files 'eclipse-common'
}

_package() {
  _variant=${1#eclipse-}
  pkgdesc+=" (${_variant} variant) Development Version"
  conflicts=('eclipse-devel')
  if [[ ${#pkgname[@]} -gt 1 ]] ; then
    depends=(eclipse-common-devel=$pkgver)
  else
    # If no -common pkg is build, we still need to depend on stuff
    depends=("java-environment>=8" webkit2gtk unzip)
    conflicts+=('eclipse-common-devel')
  fi
  provides=(eclipse-devel "eclipse-$_variant=$pkgver-$pkgrel")

  install -d "$pkgdir/opt"
  cp -a ${1%%-devel} "$pkgdir/opt/eclipse-devel"

  if [[ ${#pkgname[@]} -eq 1 ]] ; then
    _package_files "eclipse-$_variant"
  fi
}
