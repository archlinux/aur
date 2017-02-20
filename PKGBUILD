# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NOTE (1):
# This package has many git sources, being mupen64plus-rsp-z64 the main one and
# thus responsible for the first (and traditional) part of $pkgver. Due to this,
# $pkgver has an additional field in the format 'YYYMMDD.HHMMSS' which is the
# the date (in UTC time) of the last git commit from all git sources. This
# additional field allows to reflect an update in a non-main git source when the
# main git source remains without any updates.

# NOTE (2):
# A file named 'versions' in $srcdir is used to store the last builded versions
# and the date of the last upstream git commit for each one of the git sources.

# NOTE (3):
# When updating this package with makepkg (by retaining the sources on disk),
# only the needed sources will be rebuilded (only the ones that got new
# upstream git commits). To determine which git sources should be rebuilded,
# it's made comparisons between the time of the last upstream git commit that
# is stored in the 'versions' file with the updated time of the last upstream
# git commit that is retrieved at makepkg runtime. Using makepkg -f/--force
# option will force the rebuild of all git sources.

pkgname=mupen64plus-extraplugins-git
pkgver=2.0.0.r19.gafe1433.20170202.062245
pkgrel=1
pkgdesc='Additional plugins for Mupen64Plus (Git version)'
arch=('i686' 'x86_64')
url='http://www.mupen64plus.org/'
license=('GPL' 'CC0-1.0')
depends=('mupen64plus' 'sdl2' 'glew')
makedepends=('git')
provides=('mupen64plus-extraplugins')
conflicts=('mupen64plus-extraplugins')
source=("git+https://github.com/mupen64plus/mupen64plus-rsp-z64.git"
        "git+https://github.com/mupen64plus/mupen64plus-rsp-cxd4.git"
        "git+https://github.com/mupen64plus/mupen64plus-video-arachnoid.git"
        "git+https://github.com/mupen64plus/mupen64plus-video-z64.git"
        "git+https://github.com/mupen64plus/mupen64plus-video-glide64.git"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

_m64p_components="rsp-z64 rsp-cxd4 video-arachnoid video-z64 video-glide64"
_component_type="plugin"

# get component version from git repository
# arguments: none
_get_version() {
	# git, tags available
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# get the date of last git commit in format 'YYYMMDD.HHMMSS' (UTC time)
# arguments: none
_get_commit_date() {
	TZ=UTC date -d "$(git log -1 --date=short --pretty=format:%ci)" "+%Y%m%d.%H%M%S"
}

prepare() {
	# create file to hold component versions ("${srcdir}/versions")
	if ! [ -f "${srcdir}/versions" ] 
	then
	    printf "%s\n\n" "# Extraplugins for Mupen64Plus - versions"  >"${srcdir}/versions"
	    cd "${srcdir}/mupen64plus-rsp-z64"
	    printf "%s\n"   "_prev_ver_rspz64="           >>"${srcdir}/versions"
	    printf "%s\n\n" "_prev_date_rspz64="          >>"${srcdir}/versions"
	    cd "${srcdir}/mupen64plus-rsp-cxd4"
	    printf "%s\n"   "_prev_ver_rspcxd4="          >>"${srcdir}/versions"
	    printf "%s\n\n" "_prev_date_rspcxd4="         >>"${srcdir}/versions"
	    cd "${srcdir}/mupen64plus-video-arachnoid"
	    printf "%s\n"   "_prev_ver_videoarachnoid="   >>"${srcdir}/versions"
	    printf "%s\n\n" "_prev_date_videoarachnoid="  >>"${srcdir}/versions"
	    cd "${srcdir}/mupen64plus-video-z64"
	    printf "%s\n"   "_prev_ver_videoz64="         >>"${srcdir}/versions"
	    printf "%s\n\n" "_prev_date_videoz64="        >>"${srcdir}/versions"
	    cd "${srcdir}/mupen64plus-video-glide64"
	    printf "%s\n"   "_prev_ver_videoglide64="     >>"${srcdir}/versions"
	    printf "%s\n\n" "_prev_date_videoglide64="    >>"${srcdir}/versions"
	fi
	
	# load versions that are stored in file "${srcdir}/versions" (previous versions and dates)
	source "${srcdir}/versions"
	
	# get current version and date of last git commit for each component (current versions and dates)
	cd "${srcdir}/mupen64plus-rsp-z64"
	_curr_ver_rspz64="$(_get_version)"
	_curr_date_rspz64="$(_get_commit_date)"
	cd "${srcdir}/mupen64plus-rsp-cxd4"
	_curr_ver_rspcxd4="$(printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")"
	_curr_date_rspcxd4="$(_get_commit_date)"
	cd "${srcdir}/mupen64plus-video-arachnoid"
	_curr_ver_videoarachnoid="$(_get_version)"
	_curr_date_videoarachnoid="$(_get_commit_date)"
	cd "${srcdir}/mupen64plus-video-z64"
	_curr_ver_videoz64="$(_get_version)"
	_curr_date_videoz64="$(_get_commit_date)"
	cd "${srcdir}/mupen64plus-video-glide64"
	_curr_ver_videoglide64="$(_get_version)"
	_curr_date_videoglide64="$(_get_commit_date)"
	
	# get the most recent git commit date from updated git repositories
	_curr_latest_commit="$(printf "%s\n" "$_curr_date_rspz64" \
	                                     "$_curr_date_rspcxd4" \
	                                     "$_curr_date_videoarachnoid" \
	                                     "$_curr_date_videoz64" \
	                                     "$_curr_date_videoglide64" | sort -r | head -n1)"
	
	# patch min/max macros
	cd "$srcdir/mupen64plus-video-glide64/src"
	sed -i *.cpp *.h \
	    -e 's|min[[:blank:]]*(|glide_min(|g' \
	    -e 's|max[[:blank:]]*(|glide_max(|g'
}

pkgver() {
	# git, tags available
	cd "${srcdir}/mupen64plus-rsp-z64"
	printf "%s.${_curr_latest_commit}\n" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	if [ "$FORCE" = "1" ]  # FORCE=1 is makepkg -f/--force option
	then
	    msg "Forcing the build of all components..."
	else
	    msg "Building only components that were updated..."
	fi
	
	# loop through each component and build them if necessary
	for _component in ${_m64p_components}
	do
	    _update_component="false"
	    
	    # make initial steps before building
	    case "$_component" in
	        rsp-z64)
	            _component_name="rspz64"
	            _previous_version="$_prev_ver_rspz64"
	            _current_version="$_curr_ver_rspz64"
	            _current_date="$_curr_date_rspz64"
	            ;;
	        rsp-cxd4)
	            _component_name="rspcxd4"
	            _previous_version="$_prev_ver_rspcxd4"
	            _current_version="$_curr_ver_rspcxd4"
	            _current_date="$_curr_date_rspcxd4"
	            ;;
	        video-arachnoid)
	            _component_name="videoarachnoid"
	            _previous_version="$_prev_ver_videoarachnoid"
	            _current_version="$_curr_ver_videoarachnoid"
	            _current_date="$_curr_date_videoarachnoid"
	            ;;
	        video-z64)
	            _component_name="videoz64"
	            _previous_version="$_prev_ver_videoz64"
	            _current_version="$_curr_ver_videoz64"
	            _current_date="$_curr_date_videoz64"
	            ;;
	        video-glide64)
	            _component_name="videoglide64"
	            _previous_version="$_prev_ver_videoglide64"
	            _current_version="$_curr_ver_videoglide64"
	            _current_date="$_curr_date_videoglide64"
	            ;;
                *)
                    printf "%s\n" "error: invalid component (this should not happen!)"
                    exit 1
                    ;;
	    esac
	    
	    # build component if necessary
	    if [ "$(vercmp "$_current_version" "$_previous_version")" -gt "0" ] ||
	       [ "$FORCE" = "1" ] # FORCE=1 is makepkg -f/--force option
	    then
	        if [ "$_previous_version" = "" ] 
	        then
	            _previous_version="none builded" # don't show a blank version
	        fi
	        msg2 "Building ${_component} ${_component_type}..."
	        msg2 "  previous version: ${_previous_version}"
	        msg2 "  current  version: ${_current_version}"
	        make -C mupen64plus-${_component}/projects/unix clean $@
	        make -C mupen64plus-${_component}/projects/unix all $@
	    else
	        msg2 "Component ${_component} ${_component_type} is already up-to-date..."
	        printf "%s\n" "       current  version: ${_current_version}"
	    fi
	    
	    # update "$srcdir"/versions" file with current versions and latest git commit dates
	    sed -i "s/^\(_prev_ver_${_component_name}=\).*$/\1$(printf "%s" "$_current_version" | sed 's/\./\\\./g')/" "$srcdir/versions"
	    sed -i "s/^\(_prev_date_${_component_name}=\).*$/\1$(printf "%s" "$_current_date"   | sed 's/\./\\\./g')/" "$srcdir/versions"
	done
}

package() {
	for _component in ${_m64p_components}
	do
	    printf "%s\n" "************************************ Installing ${_component} ${_component_type}"
	    make -C mupen64plus-${_component}/projects/unix PREFIX=/usr DESTDIR="$pkgdir" LDCONFIG='true' install $@
	done
}
