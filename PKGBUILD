# Maintainer: TheAirBlow <pilexet.danila at gmail dot com>
# Maintainer: C_Schmidpeter <hidden>
# Contributor: indjera <indjera at gmail dot com>

# Uses latest public Xamarin DevOps successfull run:
# https://dev.azure.com/xamarin/public/_build?definitionId=48&view=runs&statusFilter=succeeded

pkgname=xamarin-android
_buildid=43659 # Build ID from public Xamarin DevOps
_version=11.4.99.0 # Version supplied from any artifact filename
_deb_filename=xamarin.android-oss_${_version}_amd64.deb
pkgver=${_version}.${_buildid}
pkgrel=1
provides=('xamarin-android')
conflicts=('xamarin-android-git'
	   'xamarin-android')
pkgdesc="Provides open-source bindings of the Android SDK for use with .NET managed languages"
arch=('x86_64')
depends=('msbuild'
         'mono>=3.0.0'
         'glibc>=2.28'
         'libzip>=1.5.1'
         'gcc-libs>=5.2'
         'lib32-gcc-libs>=5.2'
         'ncurses>=6'
         'zlib>=1:1.2.0')
makedepends=('nodejs'
             'npm'
             'curl'
             'unzip'
             'pv')
optdepends=('jdk8-openjdk: For building Xamarin.Android Apps'
            'fsharp: For compiling Xamarin.Android F# projects')
url='https://github.com/xamarin/xamarin-android'
license=('MIT')

# Directories to clean up
_directories=("usr/lib/xamarin.android/xbuild/Xamarin/Android/lib/armeabi-v7a/"
              "usr/lib/xamarin.android/xbuild/Xamarin/Android/lib/armeabi-v7a-net6/"
              "usr/lib/xamarin.android/xbuild/Xamarin/Android/lib/arm64-v8a/"
              "usr/lib/xamarin.android/xbuild/Xamarin/Android/lib/arm64-v8a-net6/"
              "usr/lib/xamarin.android/xbuild/Xamarin/Android/lib/interpreter-armeabi-v7a/"
              "usr/lib/xamarin.android/xbuild/Xamarin/Android/lib/interpreter-arm64-v8a/")

_cleanup() {
    _echo_info "Cleaning up..."
    for dir in ${_directories[*]}; do
        rm -rf ${dir}
        _echo_good "Deleted ${dir}"
    done
}

# MD5 hashsums
_build_zip_hash='c4ee7d373b2d665eb42e2e1cc24139e3'
_deb_artifact_hash='90dddd85a9620279868f0742633046bb'
_deb_data_hash=''

_getmd5() {
    echo $(md5sum $1 | awk '{ print $1 }')
}

# Make everything look nicier
_echo_info() {
    printf "$(tput bold)$(tput setaf 4)==> $(tput sgr0)$(tput bold)$1\n"
}

_echo_good() {
    printf "$(tput bold)$(tput setaf 2)==> $(tput sgr0)$(tput bold)$1\n"
}

_echo_warn() {
    printf "$(tput bold)$(tput setaf 3)==> $(tput sgr0)$(tput bold)$1\n"
}

# Download build.zip
_download() {
    cd ${srcdir}
    cd ..
    _echo_info "Downloading npm modules..."
    npm i
    _echo_info "Getting download url..."
    Link=$(node index.js ${_buildid})
    _echo_good "Got link: ${Link}"
    cd ${srcdir}
    _echo_info "Downloading..."
    curl -o build.zip ${Link}
    cd ${srcdir}
}

# Extract build.zip
_extract() {
    _echo_info "Extracting build.zip..."
    unzip -o build.zip | pv -l >/dev/null
    _echo_info "Renaming..."
    mv "installers-unsigned - Linux" "build"
}

# Prepare build.zip
prepare() {
    local hash
    if test -f "build.zip"; then
        _echo_info "Found old build.zip!"
        _echo_info "Checking MD5 hashsum..."
        hash=$(_getmd5 "build.zip")
        if [ "${hash}" = "${_build_zip_hash}" ]; then
            _echo_good "MD5 hashsum valid, skipping..."
        else
            _echo_warn "MD5 hashsum invalid, redownloading..."
            _download
        fi
    else
        _echo_info "Didn't found old build.zip!"
        _download
    fi

    if test -d "build"; then
        _echo_info "Found already extracted build.zip!"
        _echo_info "Checking MD5 hashsum of .deb artifact..."
        cd build
        hash=$(_getmd5 "${_deb_filename}")
        cd ..
        if [ "${hash}" = "${_deb_artifact_hash}" ]; then
            _echo_good "MD5 hashsum valid, skipping..."
        else
            _echo_warn "MD5 hashsum invalid, extracting..."
            _extract
        fi
    else
        _echo_info "Didn't found already extracted build.zip!"
        _extract
    fi
}

# Package .deb artifact
# We do not hashes here, cause it doesn't
# download or extract anything big here
package() {
    cd "${srcdir}/build"
    _echo_info "Extracting .deb artifact..."
    bsdtar xf ${_deb_filename}
    _echo_info "Extracting .deb data..."
    bsdtar xf data.tar.xz
    _cleanup
    _echo_info "Installing..."
    chmod -R g-w usr
    mv usr "${pkgdir}"
    _echo_good "Done!"
}
