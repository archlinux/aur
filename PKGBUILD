# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NOTE (1):
# This package has many git sources, being mupen64plus-core the main one and
# thus responsible for the first (and traditional) part of $pkgver. Due to
# this, $pkgver has an additional field in the format 'YYYMMDD.HHMMSS' which
# is the the date (in UTC time) of the last git commit from all git sources.
# This additional field allows to reflect an update in a non-main git source
# when the main git source remains without any updates.

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

pkgname=mupen64plus-git
pkgver=2.5.r222.g5f6fb04.20170219.172534
pkgrel=1
pkgdesc='Nintendo64 Emulator (Git version)'
arch=('i686' 'x86_64')
url='http://www.mupen64plus.org/'
license=('GPL')
depends=('speexdsp' 'minizip' 'hicolor-icon-theme' 'sdl2'
         'glu' 'libsamplerate' 'libpng' 'freetype2' 'boost-libs')
makedepends=('git' 'nasm' 'mesa' 'boost')
provides=('mupen64plus')
conflicts=('mupen64plus')
source=("git+https://github.com/mupen64plus/mupen64plus-core.git"
        "git+https://github.com/mupen64plus/mupen64plus-rsp-hle.git"
        "git+https://github.com/mupen64plus/mupen64plus-video-rice.git"
        "git+https://github.com/mupen64plus/mupen64plus-video-glide64mk2.git"
        "git+https://github.com/mupen64plus/mupen64plus-audio-sdl.git"
        "git+https://github.com/mupen64plus/mupen64plus-input-sdl.git"
        "git+https://github.com/mupen64plus/mupen64plus-ui-console.git"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

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
	    printf "%s\n\n" "# Mupen64Plus component versions"  >"${srcdir}/versions"
	    cd "${srcdir}/mupen64plus-core"
	    printf "%s\n"   "_prev_ver_core="             >>"${srcdir}/versions"
	    printf "%s\n\n" "_prev_date_core="            >>"${srcdir}/versions"
	    cd "${srcdir}/mupen64plus-rsp-hle"
	    printf "%s\n"   "_prev_ver_rsphle="           >>"${srcdir}/versions"
	    printf "%s\n\n" "_prev_date_rsphle="          >>"${srcdir}/versions"
	    cd "${srcdir}/mupen64plus-video-rice"
	    printf "%s\n"   "_prev_ver_videorice="        >>"${srcdir}/versions"
	    printf "%s\n\n" "_prev_date_videorice="       >>"${srcdir}/versions"
	    cd "${srcdir}/mupen64plus-video-glide64mk2"
	    printf "%s\n"   "_prev_ver_videoglide64mk2="  >>"${srcdir}/versions"
	    printf "%s\n\n" "_prev_date_videoglide64mk2=" >>"${srcdir}/versions"
	    cd "${srcdir}/mupen64plus-audio-sdl"
	    printf "%s\n"   "_prev_ver_audiosdl="         >>"${srcdir}/versions"
	    printf "%s\n\n" "_prev_date_audiosdl="        >>"${srcdir}/versions"
	    cd "${srcdir}/mupen64plus-input-sdl"
	    printf "%s\n"   "_prev_ver_inputsdl="         >>"${srcdir}/versions"
	    printf "%s\n\n" "_prev_date_inputsdl="        >>"${srcdir}/versions"
	    cd "${srcdir}/mupen64plus-ui-console"
	    printf "%s\n"   "_prev_ver_uiconsole="        >>"${srcdir}/versions"
	    printf "%s\n\n" "_prev_date_uiconsole="       >>"${srcdir}/versions"
	fi
	
	# load versions that are stored in file "${srcdir}/versions" (previous versions and dates)
	source "${srcdir}/versions"
	
	# get current version and date of last git commit for each component (current versions and dates)
	cd "${srcdir}/mupen64plus-core"
	_curr_ver_core="$(_get_version)"
	_curr_date_core="$(_get_commit_date)"
	cd "${srcdir}/mupen64plus-rsp-hle"
	_curr_ver_rsphle="$(_get_version)"
	_curr_date_rsphle="$(_get_commit_date)"
	cd "${srcdir}/mupen64plus-video-rice"
	_curr_ver_videorice="$(_get_version)"
	_curr_date_videorice="$(_get_commit_date)"
	cd "${srcdir}/mupen64plus-video-glide64mk2"
	_curr_ver_videoglide64mk2="$(_get_version)"
	_curr_date_videoglide64mk2="$(_get_commit_date)"
	cd "${srcdir}/mupen64plus-audio-sdl"
	_curr_ver_audiosdl="$(_get_version)"
	_curr_date_audiosdl="$(_get_commit_date)"
	cd "${srcdir}/mupen64plus-input-sdl"
	_curr_ver_inputsdl="$(_get_version)"
	_curr_date_inputsdl="$(_get_commit_date)"
	cd "${srcdir}/mupen64plus-ui-console"
	_curr_ver_uiconsole="$(_get_version)"
	_curr_date_uiconsole="$(_get_commit_date)"
	
	# get the most recent git commit date from updated git repositories
	_curr_latest_commit="$(printf "%s\n" "$_curr_date_core" \
	                                     "$_curr_date_rsphle" \
	                                     "$_curr_date_videorice" \
	                                     "$_curr_date_videoglide64mk2" \
	                                     "$_curr_date_audiosdl" \
	                                     "$_curr_date_inputsdl" \
	                                     "$_curr_date_uiconsole" | sort -r | head -n1)"
	
	# extract install script
	cd "${srcdir}"
	bsdtar -x -f "${srcdir}/mupen64plus-core/tools/m64p_helper_scripts.tar.gz" m64p_install.sh
	sed -i 's/source\///g' m64p_install.sh # remove unecessary 'source' directory references
}

pkgver() {
	# git, tags available
	cd "${srcdir}/mupen64plus-core"
	printf "%s.${_curr_latest_commit}\n" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	_m64p_components="core rsp-hle video-rice video-glide64mk2 audio-sdl input-sdl ui-console"
	
	if [ "$FORCE" = "1" ] 
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
	        core)
	            _component_name="core"
	            _component_type="library"
	            _previous_version="$_prev_ver_core"
	            _current_version="$_curr_ver_core"
	            _current_date="$_curr_date_core"
	            ;;
	        rsp-hle)
	            _component_name="rsphle"
	            _component_type="plugin"
	            _previous_version="$_prev_ver_rsphle"
	            _current_version="$_curr_ver_rsphle"
	            _current_date="$_curr_date_rsphle"
	            ;;
	        video-rice)
	            _component_name="videorice"
	            _component_type="plugin"
	            _previous_version="$_prev_ver_videorice"
	            _current_version="$_curr_ver_videorice"
	            _current_date="$_curr_date_videorice"
	            ;;
	        video-glide64mk2)
	            _component_name="videoglide64mk2"
	            _component_type="plugin"
	            _previous_version="$_prev_ver_videoglide64mk2"
	            _current_version="$_curr_ver_videoglide64mk2"
	            _current_date="$_curr_date_videoglide64mk2"
	            ;;
	        audio-sdl)
	            _component_name="audiosdl"
	            _component_type="plugin"
	            _previous_version="$_prev_ver_audiosdl"
	            _current_version="$_curr_ver_audiosdl"
	            _current_date="$_curr_date_audiosdl"
	            ;;
	        input-sdl)
	            _component_name="inputsdl"
	            _component_type="plugin"
	            _previous_version="$_prev_ver_inputsdl"
	            _current_version="$_curr_ver_inputsdl"
	            _current_date="$_curr_date_inputsdl"
	            ;;
	        ui-console)
	            _component_name="uiconsole"
	            _component_type="front-end"
	            _previous_version="$_prev_ver_uiconsole"
	            _current_version="$_curr_ver_uiconsole"
	            _current_date="$_curr_date_uiconsole"
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
	# set LDCONFIG since we are using fakeroot and scripts run root commands by checking the uid
	./m64p_install.sh DESTDIR="$pkgdir" PREFIX='/usr' MANDIR='/usr/share/man' LDCONFIG='true'
}
