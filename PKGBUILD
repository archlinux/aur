# Maintainer: Kimi <noreply@nodomain.org>

pkgname=kimi-linphone-desktop
pkgver=5.0.15
pkgrel=1
pkgdesc="A free VoIP and video softphone based on the SIP protocol (Installed in /usr/local with all deps included)."
arch=('x86_64')
url="https://linphone.org"
license=('GPL3')
# During compilation problems, use gcc from the previous release, for instance 'gcc11'
depends=('glew' 'gsm' 'hicolor-icon-theme' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-speech')
makedepends=('cmake' 'doxygen' 'git' 'glew' 'gcc' 'make' 'nasm' 'pandoc' 'patch' 'python-pystache' 'python-six' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-speech' 'qt5-tools' 'qt5-wayland' 'qt5-webview' 'qt5-xcb-private-headers' 'yasm' 'chrpath')
install=${pkgname}.install
# A 'release' is usually selected by adding the tag
# '#tag=x.y.z'
# at the end of the following line (uncomment it)
source=("git+https://github.com/BelledonneCommunications/linphone-desktop.git#tag=${pkgver}")
# The latest version on master branch usually works if there has not been recent updates.
# The 'master' branch is most of the time 'alpha', but can also be 'beta'.
# Comment out the following line if you use a tag version above.
# source=("git+https://github.com/BelledonneCommunications/linphone-desktop.git")
# This file takes care of the variations that can appear in the 'master' branch
# and creates three different packages based on what it finds in git repository:
#
# + kimi-linphone-desktop
# + kimi-linphone-desktop-alpha
# + kimi-linphone-desktop-beta
#
# ... depending on what $(git describe) output is.
provides=($pkgname)
#conflicts=($pkgname)
md5sums=('SKIP')
ISRELEASE=false
_app_name=linphone-desktop
_executable=linphone
_executableHumanFormat=Linphone
_packager_lowercase=kimi
_packagerHumanFormat=Kimi

prepare() {
    echo "--- Entering section prepare() ---"
    echo "--- Setting variables ---"
    echo "--- End setting variables ---"
    echo "--- Print variables ---"
    echo _app_name=$_app_name
    echo _executable=$_executable
    echo _packager_lowercase=$_packager_lowercase
    echo LANGUAGE=$LANGUAGE
    echo LC_ALL=$LC_ALL
    echo LANG=$LANG
    echo \${srcdir}=${srcdir}
    echo \${BUILDDIR}=${BUILDDIR}
    echo \${pkgdir}=${pkgdir}
    echo "--- End print variables ---"
    
    # Check if package name in this file corresponds to $(git describe)
    cd ${srcdir}/$_app_name
    CURRENT_VERSION=$(git describe | cut -d '-' -f '1-3' | sed 's/\-/./g')
    if [ "$CURRENT_VERSION" != "$pkgver" ]; then
        echo "Please update pkgver $pkgver to $CURRENT_VERSION"
        echo "I will attempt to do it for you..."
        REPLACELINE="pkgver=${pkgver/./\.}"
        echo "I will change:"
        echo "    $REPLACELINE"
        echo "to:"
        echo "pkgver=$CURRENT_VERSION"
        sed -i "s|$REPLACELINE|pkgver=$CURRENT_VERSION|g" ../../PKGBUILD
        # To see the changes, uncomment the following line:
        #cat ../../PKGBUILD
        cd ../../
        # Restart makepkg
        makepkg -f
        # Exit this thread since $pkgver is not the latest.
        exit
    fi

    # Update the git clone recursively
    git submodule update --init --recursive
    git submodule update

    cd ${srcdir}/$_app_name/$_executable-sdk
    export linphone_sdk_version=$(git describe | cut -d '-' -f '1-3' | sed 's/\-/./g')
    export linphone_desktop_major_version=$(echo $pkgver | cut -d "." -f 1)
    export linphone_desktop_minor_version=$(echo $pkgver | cut -d "." -f 2)
    export linphone_desktop_micro_version=$(echo $pkgver | cut -d "." -f 3)
    # Check substring for alpha or beta. If not found, release version?
    SUBSTRING_ALPHA='alpha'
    SUBSTRING_BETA='beta'
    export IS_LINPHONE_DESKTOP_ALPHA=false
    export IS_LINPHONE_DESKTOP_BETA=false
    if [[ "$pkgver" == *"$SUBSTRING_ALPHA"* ]]; then
        echo "You have compiled a alpha version."
        export IS_LINPHONE_DESKTOP_ALPHA=true
        export linphone_desktop_alphabeta=$SUBSTRING_ALPHA
        export linphone_desktop_alphabeta_number=$(echo $pkgver | cut -d "." -f 5)
    elif  [[ "$pkgver" == *"$SUBSTRING_BETA"* ]]; then
        echo "You have compiled a beta version."
        export IS_LINPHONE_DESKTOP_BETA=true
        export linphone_desktop_alphabeta=$SUBSTRING_BETA
        export linphone_desktop_alphabeta_number=$(echo $pkgver | cut -d "." -f 5)
    else
        echo "Cannot find alpha or beta substring. Is it a release?"
        export ISRELEASE=true
        export IS_LINPHONE_DESKTOP_ALPHA=false
        export IS_LINPHONE_DESKTOP_BETA=false
        export linphone_desktop_alphabeta=$SUBSTRING_BETA
        export linphone_desktop_alphabeta_number=0
        export LINPHONE_DESKTOP_ICON_NAME=linphone$(echo $LINPHONE_DESKTOP_TAG | sed 's/-//g')
    fi
    echo linphone_desktop_alphabeta=$linphone_desktop_alphabeta
    # Archlinux ZST package name:
    if $ISRELEASE; then
        # Release kimi-linphone-desktop
        export zst_name=$_packager_lowercase-$_app_name
    else
        # kimi-linphone-desktop-beta
        # Alpha or beta release
        export zst_name=$_packager_lowercase-$_app_name-$linphone_desktop_alphabeta
    fi
    echo zst_name=$zst_name
    cd ${srcdir}/$_app_name
    if [ "$zst_name" != "$pkgname" ]; then
        echo "Please update pkgname '$pkgname' to '$zst_name'"
        echo "I will attempt to do it for you..."
        REPLACELINE="pkgname=${pkgname}"
        echo "I will change:"
        echo "    $REPLACELINE"
        echo "to:"
        echo "pkgname=$zst_name"
        sed -i "s|$REPLACELINE|pkgname=$zst_name|g" ../../PKGBUILD
        # To see the changes, uncomment the following line:
        #cat ../../PKGBUILD
        cd ../../
        # Restart makepkg
        makepkg -f
        # Exit this thread since pkver is not the latest.
        exit
    fi
    echo "--- Exiting section prepare() ---"
}

build() {
    echo "--- Entering section build ---"
    echo "--- Setting variables ---"
    export builddir=$BUILDDIR/build
    echo "--- Setting LANGUAGE, LC_ALL, LANG ---"
    echo "Reason: To remove complaints about language not set."
    export LANGUAGE=C
    export LC_ALL=C
    export LANG=C
    echo "--- End setting LANGUAGE, LC_ALL, LANG ---"
    echo "--- End setting variables ---"
    echo "--- Print variables ---"
    echo _app_name=$_app_name
    echo LANGUAGE=$LANGUAGE
    echo LC_ALL=$LC_ALL
    echo LANG=$LANG
    echo \${srcdir}=${srcdir}
    echo \${BUILDDIR}=${BUILDDIR}
    echo \${builddir}=${builddir}
    echo \${pkgdir}=${pkgdir}
    echo "--- End print variables ---"

    cd ${srcdir}/$_app_name
    echo "--- cmake configuration ---"
    THIS_IS_WHERE_SOURCES_ARE="${srcdir}/$_app_name"
    BUILD_IT_HERE="$builddir"
    # If there are problems, uncomment the next line:
    # rm -rf "$BUILD_IT_HERE"
    mkdir -p "$BUILD_IT_HERE"
    # gcc version 12.0, 12.1 has a bug that prevents a successful compilation
    # using gcc-11.3.0 to circumvent bug in gcc-12
    # specifying CC and CXX to point to gcc-11 executables
    echo "Configuring the build..."
    # Default parallel jobs for this build is 10
    # Setting it to the value of $(nproc) which correstponds to the number of
    # cores on the system
    # PARALLEL_JOBS=10
    # Uncomment the following to use default
    PARALLEL_JOBS=$(nproc)
    echo "Setting number of parallel jobs to: $PARALLEL_JOBS"
    
    #echo CC=/usr/bin/gcc-11 CXX=/usr/bin/g++-11 cmake -DENABLE_UPDATE_CHECK=OFF -DCMAKE_BUILD_PARALLEL_LEVEL=$PARALLEL_JOBS -DCMAKE_BUILD_TYPE=RelWithDebInfo -S "$THIS_IS_WHERE_SOURCES_ARE" -B "$BUILD_IT_HERE"
    #CC=/usr/bin/gcc-11 CXX=/usr/bin/g++-11 cmake -DENABLE_UPDATE_CHECK=OFF -DCMAKE_BUILD_PARALLEL_LEVEL=$PARALLEL_JOBS -DCMAKE_BUILD_TYPE=RelWithDebInfo -S "$THIS_IS_WHERE_SOURCES_ARE" -B "$BUILD_IT_HERE"
    # 	 -DCMAKE_SKIP_RPATH=ON
    #	 -DCMAKE_SKIP_INSTALL_RPATH=ON
    echo cmake -S "$THIS_IS_WHERE_SOURCES_ARE" -B "$BUILD_IT_HERE" \
	 -DCMAKE_BUILD_PARALLEL_LEVEL=$PARALLEL_JOBS \
	 -DCMAKE_BUILD_TYPE=RelWithDebInfo \
	 -DENABLE_UPDATE_CHECK=OFF \
	 -DCMAKE_SKIP_RPATH=ON
    cmake -S "$THIS_IS_WHERE_SOURCES_ARE" -B "$BUILD_IT_HERE" \
	  -DCMAKE_BUILD_PARALLEL_LEVEL=$PARALLEL_JOBS \
	  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
	  -DENABLE_UPDATE_CHECK=OFF \
	  -DCMAKE_SKIP_RPATH=ON
    #echo "Showing the result:"
    #find "$BUILD_IT_HERE"
    echo "--- cmake configuration should have completed here ---"
    echo "--- Now I start building Linphone Desktop vlinphone_desktop_release_version $linphone_desktop_alphabeta 4 ---"
    #echo CC=/usr/bin/gcc-11 CXX=/usr/bin/g++-11 cmake --build "$BUILD_IT_HERE" --target install --parallel $PARALLEL_JOBS --config RelWithDebInfo
    #CC=/usr/bin/gcc-11 CXX=/usr/bin/g++-11 cmake --build "$BUILD_IT_HERE" --target install --parallel $PARALLEL_JOBS --config RelWithDebInfo
    echo cmake --build "$BUILD_IT_HERE" --target install --parallel $PARALLEL_JOBS --config RelWithDebInfo
    cmake --build "$BUILD_IT_HERE" --target install --parallel $PARALLEL_JOBS --config RelWithDebInfo
    # Fix RPATH error during packaging
    chrpath -d ${builddir}/OUTPUT/bin/linphone
    echo "--- Build should have completed here ---"
    echo "--- Exiting section build() ---"
}

package() {
    echo "--- Entering section package ---"
    echo "--- Setting variables ---"
    echo _app_name=$_app_name
    #builddir=$BUILDDIR/build
    #ISRELEASE=false #true/false
    USELOGFILE=false #true/false
    #_app_name=linphone-desktop
    #_packager_lowercase=kimi
    LOGFILE=/tmp/$pkgname-package_$(date +%s | sha256sum | base64 | head -c 5).log
    #executable=linphone
    cd ${srcdir}/$_app_name/$_executable-sdk
    export linphone_sdk_version=$(git describe | cut -d '-' -f '1-3' | sed 's/\-/./g')
    export linphone_desktop_major_version=$(echo $pkgver | cut -d "." -f 1)
    export linphone_desktop_minor_version=$(echo $pkgver | cut -d "." -f 2)
    export linphone_desktop_micro_version=$(echo $pkgver | cut -d "." -f 3)
    # Check substring for alpha or beta. If not found, release version?

    # Check substring for alpha or beta. If not found, release version?
    SUBSTRING_ALPHA='alpha'
    SUBSTRING_BETA='beta'
    export IS_LINPHONE_DESKTOP_ALPHA=false
    export IS_LINPHONE_DESKTOP_BETA=false
    if [[ "$pkgver" == *"$SUBSTRING_ALPHA"* ]]; then
        echo "You have compiled a alpha version."
        export IS_LINPHONE_DESKTOP_ALPHA=true
        export linphone_desktop_alphabeta=$SUBSTRING_ALPHA
        export linphone_desktop_alphabeta_number=$(echo $pkgver | cut -d "." -f 5)
    elif  [[ "$pkgver" == *"$SUBSTRING_BETA"* ]]; then
        echo "You have compiled a beta version."
        export IS_LINPHONE_DESKTOP_BETA=true
        export linphone_desktop_alphabeta=$SUBSTRING_BETA
        export linphone_desktop_alphabeta_number=$(echo $pkgver | cut -d "." -f 5)
    else
        echo "Cannot find alpha or beta substring. Is it a release?"
        export ISRELEASE=true
        export IS_LINPHONE_DESKTOP_ALPHA=false
        export IS_LINPHONE_DESKTOP_BETA=false
        export linphone_desktop_alphabeta=$SUBSTRING_BETA
        export linphone_desktop_alphabeta_number=0
        export LINPHONE_DESKTOP_ICON_NAME=linphone$(echo $LINPHONE_DESKTOP_TAG | sed 's/-//g')
    fi
    echo linphone_desktop_alphabeta=$linphone_desktop_alphabeta

    # Archlinux ZST package name:
    if $ISRELEASE; then
        # Release kimi-linphone-desktop
        export zst_name=$_packager_lowercase-$_app_name
    else
        # kimi-linphone-desktop-beta
        # Alpha or beta release
        export zst_name=$_packager_lowercase-$_app_name-$linphone_desktop_alphabeta
    fi
    
    # Check variable ISRELEASE
    echo ISRELEASE=$ISRELEASE
    
    if $ISRELEASE; then
        # 440
        linphone_desktop_tag=$linphone_desktop_major_version$linphone_desktop_minor_version$linphone_desktop_micro_version
    else
        # 440-alpha1
        linphone_desktop_tag=$linphone_desktop_major_version$linphone_desktop_minor_version$linphone_desktop_micro_version-$linphone_desktop_alphabeta$linphone_desktop_alphabeta_number
    fi
    # linphone440-alpha1
    # linphone440
    executable_tag_lowercase=$_executable$linphone_desktop_tag
    # LINPHONE440-alpha1
    executable_tag_uppercase=$(echo $executable_tag_lowercase | tr '[:lower:]' '[:upper:]')
    if $ISRELEASE; then
        # 4.4.0
        linphone_version=$linphone_desktop_major_version.$linphone_desktop_minor_version.$linphone_desktop_micro_version
    else
        # 4.4.0-alpha.1
        linphone_version=$linphone_desktop_major_version.$linphone_desktop_minor_version.$linphone_desktop_micro_version-$linphone_desktop_alphabeta.$linphone_desktop_alphabeta_number
    fi
    # 4.4.0
    if $ISRELEASE; then
        # 4.4.0
        linphone_desktop_release_version=$linphone_desktop_major_version.$linphone_desktop_minor_version.$linphone_desktop_micro_version
    else
        # 4.4.0.1
        linphone_desktop_release_version=$linphone_desktop_major_version.$linphone_desktop_minor_version.$linphone_desktop_micro_version.$linphone_desktop_alphabeta_number
    fi
    if $ISRELEASE; then
        # 4.4.0
        linphone_desktop_version=$linphone_desktop_major_version.$linphone_desktop_minor_version.$linphone_desktop_micro_version
    else
        # 4.4.0.alpha.1
        linphone_desktop_version=$linphone_desktop_major_version.$linphone_desktop_minor_version.$linphone_desktop_micro_version.$linphone_desktop_alphabeta.$linphone_desktop_alphabeta_number
    fi
    if $ISRELEASE; then
        linphone_desktop_alphabeta_version=""
    else
        # alpha.1
        linphone_desktop_alphabeta_version=$linphone_desktop_alphabeta.$linphone_desktop_alphabeta_number
    fi
    THISMONTH=$(LC_TIME="en_US.UTF-8" date +%B)
    THISYEAR=$(date +%Y)
    manpage_date="$THISMONTH $THISYEAR"
    linphone_desktop_parent_dir_prefix=/usr/local/$_app_name
    linphone_desktop_install_parent_reldir=usr/local/$_app_name
    linphone_desktop_install_dir=$linphone_desktop_parent_dir_prefix/$linphone_version
    linphone_desktop_install_prefix=$linphone_desktop_install_dir
    menuFileNameTwo=$executable_tag_lowercase-minimized.desktop
    menuFullFilePathTwo=$pkgdir$linphone_desktop_install_prefix/share/applications/$menuFileNameTwo
    if $ISRELEASE; then
        zst_name=$_packager_lowercase-$_app_name
    else
        zst_name=$_packager_lowercase-$_app_name-$linphone_desktop_alphabeta
    fi
    DISTRO=$(awk -F= '/^NAME/{print $2}' /etc/os-release | cut -d'=' -f2)
    DISTROVERSION=$(awk -F= '/^VERSION_ID/{print $2}' /etc/os-release)
    if $ISRELEASE; then
        # 440
        linphone_desktop_condensed_tag=$linphone_desktop_major_version$linphone_desktop_minor_version$linphone_desktop_micro_version
    else
        # 440alpha1
        linphone_desktop_condensed_tag=$linphone_desktop_major_version$linphone_desktop_minor_version$linphone_desktop_micro_version$linphone_desktop_alphabeta$linphone_desktop_alphabeta_number
    fi
    executable_condensed_tag=$_executable$linphone_desktop_condensed_tag
    linphone_desktop_parent_dir_prefix=/usr/local/$_app_name
    linphone_desktop_install_parent_reldir=usr/local/$_app_name
    linphone_desktop_install_dir=$linphone_desktop_parent_dir_prefix/$linphone_version
    linphone_desktop_install_prefix=$linphone_desktop_install_dir
    linphone_desktop_install_reldir=$linphone_desktop_install_parent_reldir/$linphone_version
    linphone_desktop_install_scripts_dir=/usr/local/bin
    linphone_desktop_install_scripts_prefix=$linphone_desktop_install_scripts_dir
    linphone_desktop_install_scripts_reldir=usr/local/bin
    linphone_desktop_install_share_prefix=/usr/share
    linphone_desktop_install_share_reldir=usr/share
    linphone_desktop_install_man_prefix=$linphone_desktop_install_prefix/man/man1
    linphone_desktop_install_man_reldir=$linphone_desktop_install_reldir/man/man1
    system_mandir=/usr/local/man/man1
    system_man_dir=$system_mandir
    system_man_reldir=usr/local/man/man1
    system_sharedir=/usr/share
    system_share_dir=$system_sharedir
    system_share_reldir=usr/share
    system_scalable_icondir=/usr/share/icons/hicolor/scalable/apps
    system_scalable_icon_dir=$system_scalable_icondir
    system_scalable_icon_reldir=usr/share/icons/hicolor/scalable/apps
    linphone_desktop_install_man_reldir=usr/local/share/man/man1
    system_scalable_hicolor_icons_prefix=$linphone_desktop_install_share_prefix/icons/hicolor/scalable/apps
    linphone_desktop_scalable_hicolor_icons_prefix=$linphone_desktop_install_prefix/share/icons/hicolor/scalable/apps
    linphone_desktop_scalable_hicolor_icons_reldir=$linphone_desktop_install_reldir/share/icons/hicolor/scalable/apps
    scalable_hicolor_icons_reldir=share/icons/hicolor/scalable/apps
    system_app_launchers_prefix=$linphone_desktop_install_share_prefix/applications
    linphone_desktop_app_launchers_prefix=$linphone_desktop_install_share_prefix/share/applications
    system_bindir=/usr/local/bin
    linphone_desktop_bindir=$linphone_desktop_install_prefix/bin
    linphone_desktop_relbindir=$linphone_desktop_install_reldir/bin
    executable_tag_lowercase=$_executable$linphone_desktop_tag
    auto_start_script_filename=auto-start-$executable_tag_lowercase
    remove_auto_start_script_filename=$auto_start_script_filename-remove
    manpageFileName=$executable_tag_lowercase.1
    manpageFullFilePath=$system_mandir/$manpageFileName
    TITLE="$_executableHumanFormat $linphone_version"
    menuFileNameOne=$executable_tag_lowercase.desktop
    menuFullFilePathOne=$pkgdir$system_app_launchers_prefix/$menuFileNameOne
    menuFileNameTwo=$executable_tag_lowercase-minimized.desktop
    menuFullFilePathTwo=$pkgdir$linphone_desktop_install_prefix/share/applications/$menuFileNameTwo
    scriptFileNameOne=uninstall-$executable_tag_lowercase
    scriptFullFilePathOne=$system_bindir/$scriptFileNameOne
    scriptFileNameTwo=change-$executable_tag_lowercase-icon
    scriptFullFilePathTwo=$system_bindir/$scriptFileNameTwo
    linphone_desktop_icon_name=$_executable$linphone_desktop_condensed_tag
    linphone_desktop_icon_filename=$_executable$linphone_desktop_condensed_tag.svg
    iconFileNameOne=$_executable$linphone_desktop_condensed_tag.svg
    iconFullFilePathOne=$system_scalable_icondir/$iconFileNameOne
    linphone_standard_icon_name=$_executable
    linphone_standard_icon_filename=$_executable.svg
    linphone_alpha_icon_name=${_executable}_alpha
    linphone_alpha_icon_filename=$linphone_alpha_icon_name.svg
    linphone_beta_icon_name=${_executable}_beta
    linphone_beta_icon_filename=$linphone_beta_icon_name.svg
    linphone_extra_icon_name_one=${_executable}_orange_01
    linphone_extra_icon_filename_one=${_executable}_orange_01.svg
    linphone_extra_icon_name_two=${_executable}_gray_01
    linphone_extra_icon_filename_two=${_executable}_gray_01.svg
    linphone_extra_icon_name_three=${_executable}_gray_02
    linphone_extra_icon_filename_three=${_executable}_gray_02.svg
    linphone_extra_icon_name_four=${_executable}_green_01
    linphone_extra_icon_filename_four=${_executable}_green_01.svg
    linphone_extra_icon_name_five=${_executable}_gray_03
    linphone_extra_icon_filename_five=${_executable}_gray_03.svg
    # Archlinux ZST package name:
    if $ISRELEASE; then
        # Release
        zst_name=$_packager_lowercase-$_app_name
    else
        # kimi-linphone-desktop-beta
        # Alpha or beta release
        zst_name=$_packager_lowercase-$_app_name-$linphone_desktop_alphabeta
    fi
    linphone_desktop_pacman_zst_identifier=$zst_name
    echo zst_name=$zst_name
    echo linphone_desktop_pacman_zst_identifier=$linphone_desktop_pacman_zst_identifier

    linphone_sdk_zst_release=""
    linphone_desktop_zst_release=""

    # Release
    if $ISRELEASE; then
        source_root_directory=$_packager_lowercase-$_app_name-$linphone_desktop_release_version
    fi
    
    # These variables should not require any manual editing

    scriptFileNameOne=change-$_executable-icon
    scriptFullFilePathOne=$pkgdir$linphone_desktop_install_prefix/bin/$scriptFileNameOne
    scriptLinkNameOne=change-$_executable$linphone_desktop_tag-icon
    scriptLinkFileNameOne=$pkgdir/usr/local/bin/$scriptLinkNameOne

    scriptFileNameNineteen=change-$_executable-icon
    scriptFullFilePathNineteen=$pkgdir$linphone_desktop_install_prefix/bin/$scriptFileNameNineteen
    scriptLinkNameNineteen=change-$_executable$linphone_desktop_tag-icon
    scriptLinkFileNameNineteen=$pkgdir/usr/local/bin/$scriptLinkNameNineteen

    scriptFullFilePathThirtyTwo=$pkgdir$linphone_desktop_install_prefix/bin/change-linphone-icon
    scriptLinkFullFilePathThirtyTwo=$pkgdir/usr/local/bin/change-linphone$linphone_desktop_tag-icon

    scriptFileNameTwo=uninstall-$_executable
    scriptFullFilePathTwo=$pkgdir$linphone_desktop_install_prefix/bin/$scriptFileNameTwo
    scriptLinkNameTwo=uninstall-$_executable$linphone_desktop_tag
    scriptLinkFileNameTwo=$pkgdir/usr/local/bin/$scriptLinkNameTwo

    scriptFileNameTwenty=uninstall-$_executable
    scriptFullFilePathTwenty=$pkgdir$linphone_desktop_install_prefix/bin/$scriptFileNameTwenty
    scriptLinkNameTwenty=uninstall-$_executable$linphone_desktop_tag
    scriptLinkFileNameTwenty=$pkgdir/usr/local/bin/$scriptLinkNameTwenty

    scriptFileNameThree=auto-start-$_executable
    scriptFullFilePathThree=$pkgdir$linphone_desktop_install_prefix/bin/$scriptFileNameThree
    scriptLinkNameThree=auto-start-$_executable$linphone_desktop_tag
    scriptLinkFileNameThree=$pkgdir/usr/local/bin/$scriptLinkNameThree

    scriptFileNameFour=auto-start-$_executable-remove
    scriptFullFilePathFour=$pkgdir$linphone_desktop_install_prefix/bin/$scriptFileNameFour
    scriptLinkNameFour=auto-start-$_executable$linphone_desktop_tag-remove
    scriptLinkFileNameFour=$pkgdir/usr/local/bin/$scriptLinkNameFour

    # Release
    if $ISRELEASE; then
        linphone_desktop_icon_name=$_executable$linphone_desktop_major_version$linphone_desktop_minor_version$linphone_desktop_micro_version
    fi
    linphone_desktop_icon_filename=$linphone_desktop_icon_name.svg
    linphone_alpha_icon_name=linphone_alpha
    linphone_alpha_icon_filename=$linphone_alpha_icon_name.svg
    linphone_beta_icon_name=linphone_beta
    linphone_beta_icon_filename=$linphone_beta_icon_name.svg
    linphone_extra_icon_name_one=linphone_orange_01
    linphone_extra_icon_filename_one=$linphone_extra_icon_name_one.svg
    linphone_extra_icon_name_two=linphone_gray_01
    linphone_extra_icon_filename_two=$linphone_extra_icon_name_two.svg
    linphone_extra_icon_name_three=linphone_gray_02
    linphone_extra_icon_filename_three=$linphone_extra_icon_name_three.svg
    linphone_extra_icon_name_four=linphone_green_01
    linphone_extra_icon_filename_four=$linphone_extra_icon_name_four.svg
    linphone_extra_icon_name_five=linphone_gray_03
    linphone_extra_icon_filename_five=$linphone_extra_icon_name_five.svg
    linphone_extra_icon_name_six=linphone_blue_01
    linphone_extra_icon_filename_six=$linphone_extra_icon_name_six.svg

    linphone_desktop_parent_dir_prefix=/usr/local/$_app_name
    linphone_desktop_install_parent_reldir=usr/local/$_app_name
    linphone_desktop_install_dir=$linphone_desktop_parent_dir_prefix/$linphone_version
    linphone_desktop_install_prefix=$linphone_desktop_install_dir
    linphone_desktop_install_reldir=$linphone_desktop_install_parent_reldir/$linphone_version
    linphone_desktop_install_scripts_dir=/usr/local/bin
    linphone_desktop_install_scripts_prefix=$linphone_desktop_install_scripts_dir
    linphone_desktop_install_scripts_reldir=usr/local/bin
    linphone_desktop_install_share_dir=/usr/share
    linphone_desktop_install_share_prefix=$linphone_desktop_install_share_dir
    linphone_desktop_install_share_reldir=usr/share
    linphone_desktop_install_man_dir=/usr/local/man/man1
    linphone_desktop_install_man_prefix=$linphone_desktop_install_man_dir
    linphone_desktop_install_man_reldir=usr/local/man/man1

    # No $pkgdir in the following directories:
    system_app_launchers_prefix=$linphone_desktop_install_share_prefix/applications
    linphone_desktop_app_launchers_prefix=$linphone_desktop_install_share_prefix/applications
    system_scalable_hicolor_icons_prefix=$linphone_desktop_install_share_prefix/icons/hicolor/scalable/apps
    linphone_desktop_scalable_hicolor_icons_prefix=$linphone_desktop_install_scripts_prefix/share/icons/hicolor/scalable/apps
    system_man_prefix=$linphone_desktop_install_man_prefix
    linphone_desktop_man_prefix=$linphone_desktop_install_share_prefix

    TITLE="$_executableHumanFormat $linphone_version"
    menuFileNameOne=$_executable$linphone_desktop_tag.desktop
    menuFullFilePathOne=$pkgdir$linphone_desktop_install_share_prefix/applications/$menuFileNameOne
    menuFileNameTwo=$_executable$linphone_desktop_tag-minimized.desktop
    menuFullFilePathTwo=$pkgdir$linphone_desktop_install_prefix/share/applications/$menuFileNameTwo

    manpageFileName=$_executable$linphone_desktop_tag.1
    manpageFullFilePath=$pkgdir$linphone_desktop_install_man_prefix/$manpageFileName
    echo "--- End setting variables ---"
    echo "--- Print variables ---"
    echo \${BUILDDIR}=${BUILDDIR}
    echo \${builddir}=${builddir}
    echo \${pkgdir}=${pkgdir}
    echo \${srcdir}=${srcdir}
    echo _app_name=$_app_name
    echo linphone_sdk_version=$linphone_sdk_version
    echo auto_start_script_filename=$auto_start_script_filename
    echo builddir=$builddir
    echo DISTRO=$DISTRO
    echo DISTROVERSION=$DISTROVERSION
    echo executable_condensed_tag=$executable_condensed_tag
    echo executable_tag_lowercase=$executable_tag_lowercase
    echo executable_tag_uppercase=$executable_tag_uppercase
    echo _executable=$_executable
    echo _executableHumanFormat=$_executableHumanFormat
    echo iconFileNameOne=$iconFileNameOne
    echo iconFullFilePathOne=$iconFullFilePathOne
    echo IS_LINPHONE_DESKTOP_ALPHA=$IS_LINPHONE_DESKTOP_ALPHA
    echo IS_LINPHONE_DESKTOP_BETA=$IS_LINPHONE_DESKTOP_BETA
    echo ISRELEASE=$ISRELEASE
    echo LANG=$LANG
    echo LANGUAGE=$LANGUAGE
    echo LC_ALL=$LC_ALL
    echo linphone_alpha_icon_filename=$linphone_alpha_icon_filename
    echo linphone_alpha_icon_name=$linphone_alpha_icon_name
    echo linphone_beta_icon_filename=$linphone_beta_icon_filename
    echo linphone_beta_icon_name=$linphone_beta_icon_name
    echo linphone_desktop_alphabeta_number=$linphone_desktop_alphabeta_number
    echo linphone_desktop_alphabeta_version=$linphone_desktop_alphabeta_version
    echo linphone_desktop_alphabeta=$linphone_desktop_alphabeta
    echo linphone_desktop_app_launchers_prefix=$linphone_desktop_app_launchers_prefix
    echo linphone_desktop_bindir=$linphone_desktop_bindir
    echo linphone_desktop_condensed_tag=$linphone_desktop_condensed_tag
    echo linphone_desktop_icon_filename=$linphone_desktop_icon_filename
    echo LINPHONE_DESKTOP_ICON_NAME=$LINPHONE_DESKTOP_ICON_NAME
    echo linphone_desktop_icon_name=$linphone_desktop_icon_name
    echo linphone_desktop_install_dir=$linphone_desktop_install_dir
    echo linphone_desktop_install_man_dir=$linphone_desktop_install_man_dir
    echo linphone_desktop_install_man_prefix=$linphone_desktop_install_man_prefix
    echo linphone_desktop_install_man_reldir=$linphone_desktop_install_man_reldir
    echo linphone_desktop_install_parent_reldir=$linphone_desktop_install_parent_reldir
    echo linphone_desktop_install_prefix=$linphone_desktop_install_prefix
    echo linphone_desktop_install_reldir=$linphone_desktop_install_reldir
    echo linphone_desktop_install_scripts_dir=$linphone_desktop_install_scripts_dir
    echo linphone_desktop_install_scripts_prefix=$linphone_desktop_install_scripts_prefix
    echo linphone_desktop_install_scripts_reldir=$linphone_desktop_install_scripts_reldir
    echo linphone_desktop_install_share_dir=$linphone_desktop_install_share_dir
    echo linphone_desktop_install_share_prefix=$linphone_desktop_install_share_prefix
    echo linphone_desktop_install_share_reldir=$linphone_desktop_install_share_reldir
    echo linphone_desktop_major_version=$linphone_desktop_major_version
    echo linphone_desktop_man_prefix=$linphone_desktop_man_prefix
    echo linphone_desktop_micro_version=$linphone_desktop_micro_version
    echo linphone_desktop_minor_version=$linphone_desktop_minor_version
    echo linphone_desktop_pacman_zst_identifier=$linphone_desktop_pacman_zst_identifier
    echo linphone_desktop_parent_dir_prefix=$linphone_desktop_parent_dir_prefix
    echo linphone_desktop_relbindir=$linphone_desktop_relbindir
    echo linphone_desktop_release_version=$linphone_desktop_release_version
    echo linphone_desktop_scalable_hicolor_icons_prefix=$linphone_desktop_scalable_hicolor_icons_prefix
    echo linphone_desktop_scalable_hicolor_icons_reldir=$linphone_desktop_scalable_hicolor_icons_reldir
    echo linphone_desktop_tag=$linphone_desktop_tag
    echo linphone_desktop_version=$linphone_desktop_version
    echo linphone_desktop_zst_release=$linphone_desktop_zst_release
    echo linphone_extra_icon_filename_five=$linphone_extra_icon_filename_five
    echo linphone_extra_icon_filename_four=$linphone_extra_icon_filename_four
    echo linphone_extra_icon_filename_one=$linphone_extra_icon_filename_one
    echo linphone_extra_icon_filename_six=$linphone_extra_icon_filename_six
    echo linphone_extra_icon_filename_three=$linphone_extra_icon_filename_three
    echo linphone_extra_icon_filename_two=$linphone_extra_icon_filename_two
    echo linphone_extra_icon_name_five=$linphone_extra_icon_name_five
    echo linphone_extra_icon_name_four=$linphone_extra_icon_name_four
    echo linphone_extra_icon_name_one=$linphone_extra_icon_name_one
    echo linphone_extra_icon_name_six=$linphone_extra_icon_name_six
    echo linphone_extra_icon_name_three=$linphone_extra_icon_name_three
    echo linphone_extra_icon_name_two=$linphone_extra_icon_name_two
    echo linphone_sdk_zst_release=$linphone_sdk_zst_release
    echo linphone_standard_icon_filename=$linphone_standard_icon_filename
    echo linphone_standard_icon_name=$linphone_standard_icon_name
    echo linphone_version=$linphone_version
    echo LOGFILE=$LOGFILE
    echo manpage_date=$manpage_date
    echo manpageFileName=$manpageFileName
    echo manpageFullFilePath=$manpageFullFilePath
    echo menuFileNameOne=$menuFileNameOne
    echo menuFileNameTwo=$menuFileNameTwo
    echo menuFullFilePathOne=$menuFullFilePathOne
    echo menuFullFilePathTwo=$menuFullFilePathTwo
    echo package_name=$package_name
    echo _packager_lowercase=$_packager_lowercase
    echo _packagerHumanFormat=$_packagerHumanFormat
    echo remove_auto_start_script_filename=$remove_auto_start_script_filename
    echo scalable_hicolor_icons_reldir=$scalable_hicolor_icons_reldir
    echo scriptFileNameFour=$scriptFileNameFour
    echo scriptFileNameNineteen=$scriptFileNameNineteen
    echo scriptFileNameOne=$scriptFileNameOne
    echo scriptFileNameThree=$scriptFileNameThree
    echo scriptFileNameTwenty=$scriptFileNameTwenty
    echo scriptFileNameTwo=$scriptFileNameTwo
    echo scriptFullFilePathFour=$scriptFullFilePathFour
    echo scriptFullFilePathNineteen=$scriptFullFilePathNineteen
    echo scriptFullFilePathOne=$scriptFullFilePathOne
    echo scriptFullFilePathThirtyTwo=$scriptFullFilePathThirtyTwo
    echo scriptFullFilePathThree=$scriptFullFilePathThree
    echo scriptFullFilePathTwenty=$scriptFullFilePathTwenty
    echo scriptFullFilePathTwo=$scriptFullFilePathTwo
    echo scriptLinkFileNameFour=$scriptLinkFileNameFour
    echo scriptLinkFileNameNineteen=$scriptLinkFileNameNineteen
    echo scriptLinkFileNameOne=$scriptLinkFileNameOne
    echo scriptLinkFileNameThree=$scriptLinkFileNameThree
    echo scriptLinkFileNameTwenty=$scriptLinkFileNameTwenty
    echo scriptLinkFileNameTwo=$scriptLinkFileNameTwo
    echo scriptLinkFullFilePathThirtyTwo=$scriptLinkFullFilePathThirtyTwo
    echo scriptLinkNameFour=$scriptLinkNameFour
    echo scriptLinkNameNineteen=$scriptLinkNameNineteen
    echo scriptLinkNameOne=$scriptLinkNameOne
    echo scriptLinkNameThree=$scriptLinkNameThree
    echo scriptLinkNameTwenty=$scriptLinkNameTwenty
    echo scriptLinkNameTwo=$scriptLinkNameTwo
    echo source_root_directory=$source_root_directory
    echo SUBSTRING_ALPHA=$SUBSTRING_ALPHA
    echo SUBSTRING_BETA=$SUBSTRING_BETA
    echo system_app_launchers_prefix=$system_app_launchers_prefix
    echo system_bindir=$system_bindir
    echo system_man_dir=$system_man_dir
    echo system_man_prefix=$system_man_prefix
    echo system_man_reldir=$system_man_reldir
    echo system_mandir=$system_mandir
    echo system_scalable_hicolor_icons_prefix=$system_scalable_hicolor_icons_prefix
    echo system_scalable_icon_dir=$system_scalable_icon_dir
    echo system_scalable_icon_reldir=$system_scalable_icon_reldir
    echo system_scalable_icondir=$system_scalable_icondir
    echo system_share_dir=$system_share_dir
    echo system_share_reldir=$system_share_reldir
    echo system_sharedir=$system_sharedir
    echo THISMONTH=$THISMONTH
    echo THISYEAR=$THISYEAR
    echo TITLE=$TITLE
    echo USELOGFILE=$USELOGFILE
    echo zst_name=$zst_name
    echo "--- End print variables ---"

    # Fix ${pkgname}.install file
    cd ${BUILDDIR}
    cp -v ${_packager_lowercase}-${_app_name}.install_template ${pkgname}.install
    echo "Please update ${pkgname}.install file to $pkgver"
    echo "I will attempt to update ${pkgname}.install file for you..."
    echo

    REPLACELINE="linphone_desktop_major_version=ABCDEFG"
    echo "I will change:"
    echo "    $REPLACELINE"
    echo "to:"
    echo "    linphone_desktop_major_version=$linphone_desktop_major_version"
    sed -i "s|$REPLACELINE|linphone_desktop_major_version=$linphone_desktop_major_version|g" ${pkgname}.install

    REPLACELINE="linphone_desktop_minor_version=HIJKLMN"
    echo "I will change:"
    echo "    $REPLACELINE"
    echo "to:"
    echo "    linphone_desktop_minor_version=$linphone_desktop_minor_version"
    sed -i "s|$REPLACELINE|linphone_desktop_minor_version=$linphone_desktop_minor_version|g" ${pkgname}.install

    REPLACELINE="linphone_desktop_micro_version=OPQRSTU"
    echo "I will change:"
    echo "    $REPLACELINE"
    echo "to:"
    echo "    linphone_desktop_micro_version=$linphone_desktop_micro_version"
    sed -i "s|$REPLACELINE|linphone_desktop_micro_version=$linphone_desktop_micro_version|g" ${pkgname}.install

    REPLACELINE="linphone_desktop_alphabeta=DEFGHIJ"
    echo "I will change:"
    echo "    $REPLACELINE"
    echo "to:"
    echo "    linphone_desktop_alphabeta=$linphone_desktop_alphabeta"
    sed -i "s|$REPLACELINE|linphone_desktop_alphabeta=$linphone_desktop_alphabeta|g" ${pkgname}.install

    REPLACELINE="linphone_desktop_alphabeta_number=KLMNOPQ"
    echo "I will change:"
    echo "    $REPLACELINE"
    echo "to:"
    echo "    linphone_desktop_alphabeta_number=$linphone_desktop_alphabeta_number"
    sed -i "s|$REPLACELINE|linphone_desktop_alphabeta_number=$linphone_desktop_alphabeta_number|g" ${pkgname}.install

    if $ISRELEASE; then
        REPLACELINE="ISRELEASE=false"
        echo "I will change:"
        echo "    $REPLACELINE"
        echo "to:"
        echo "    ISRELEASE=true"
        sed -i "s|$REPLACELINE|ISRELEASE=true|g" ${pkgname}.install
    fi
    
    echo "-------------------------------"
    echo pkgdir=$pkgdir
    echo "-------------------------------"

    mkdir -p -v "$pkgdir/usr/local/$_app_name/$linphone_version"
    mkdir -p -v "$pkgdir/usr/local/bin"
    mkdir -p -v "$pkgdir/usr/share/mime/packages"
    mkdir -p -v "$pkgdir/usr/share/applications"
    mkdir -p -v "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    mkdir -p -v "$pkgdir/usr/local/man/man1"

    cd ${BUILDDIR}
    cp -rpv ${builddir}/OUTPUT/* "$pkgdir/usr/local/$_app_name/$linphone_version"

    # alpha icon to distinguish it is a alpha version and not a release version
    echo "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"512\" height=\"512\" xml:space=\"preserve\"><path fill=\"#C95328\" d=\"M512 433.229C512 476.562 476.557 512 433.228 512H78.768C35.452 512 0 476.562 0 433.229V78.763C0 35.43 35.452 0 78.768 0h354.46C476.557 0 512 35.43 512 78.763v354.466z\"/><linearGradient id=\"a\" gradientUnits=\"userSpaceOnUse\" x1=\"256.004\" y1=\"498.877\" x2=\"256.004\" y2=\"13.132\"><stop offset=\"0\" style=\"stop-color:#e6b043\"/><stop offset=\".5\" style=\"stop-color:#c95328\"/></linearGradient><path fill=\"url(#a)\" d=\"M78.768 498.877c-36.188 0-65.632-29.438-65.632-65.648V78.763c0-36.21 29.443-65.631 65.632-65.631h354.46c36.202 0 65.645 29.421 65.645 65.631v354.465c0 36.21-29.443 65.648-65.645 65.648H78.768z\"/><path d=\"M473.412 129.19c4.022 16.057 11.006 21.111 14.433 6.539 2.626-12.988-.907-31.173-15.294-50.564-28.484-41.915-103.78-66.186-162.935-44.793-31.137 11.984-24.661 13.922 7.499 7.175 58.118-10.362 116.214 15.009 141.418 51.351 7.501 10.271 12.299 20.659 14.879 30.292z\" style=\"fill:#c95328\" transform=\"rotate(-106.111 271.362 207.454)\"/><path d=\"M419.015 143.098c7.494 14.941 12.717 26.531 19.203 25.729 6.259-.803 15.077-12.937 11.313-29.547-2.509-10.809-8.09-22.524-17.543-33.749-28.203-35.815-93.65-54.292-150.259-31.286-29.453 11.077-49.386 32.979-50.211 36.716-1.109 4.036 18.227-9.882 45.146-18.015 35.711-11.303 76.217-6.516 105.15 11.224 18.366 11.001 30.457 25.282 37.201 38.928z\" style=\"fill:#c95328\" transform=\"rotate(-106.111 271.362 207.454)\"/><path d=\"M272.768 116.451c-23.938 6.501-41.564 24.912-39.126 28.578 2.162 3.725 15.671-.811 29.184-4.844 8.038-2.487 16.081-3.953 23.938-4.465 25.749-1.574 45.468 6.943 57.738 17.625 11.416 9.433 22.448 19.878 31.148 19.694 8.566-.117 15.136-11.611 7.022-24.39-8.806-13.192-24.526-26.198-47.588-32.772-19.007-5.462-41.061-5.518-62.316.574z\" style=\"fill:#c95328\" transform=\"rotate(-106.111 271.362 207.454)\"/><g><path d=\"M471.9 135.938c4.029 16.063 11.007 21.124 14.451 6.533 2.614-12.977-.917-31.161-15.322-50.563-28.482-41.924-103.761-66.172-162.917-44.792-31.146 11.995-24.653 13.946 7.502 7.184 58.08-10.377 116.211 14.988 141.407 51.347 7.508 10.277 12.302 20.639 14.879 30.291z\" style=\"fill:#fff\" transform=\"scale(-1 1) rotate(-40.555 170.67 793.864)\"/><path d=\"M417.504 149.867c7.505 14.928 12.724 26.518 19.188 25.708 6.278-.797 15.089-12.928 11.332-29.564-2.513-10.809-8.095-22.504-17.548-33.728C402.261 76.469 336.838 58 280.209 81.002c-29.433 11.073-49.345 32.962-50.192 36.706-1.089 4.03 18.224-9.864 45.125-17.983 35.73-11.315 76.235-6.557 105.167 11.199 18.359 11.009 30.453 25.299 37.195 38.943z\" style=\"fill:#fff\" transform=\"scale(-1 1) rotate(-40.555 170.67 793.864)\"/><path d=\"M271.267 123.201c-23.948 6.485-41.572 24.917-39.134 28.582 2.168 3.729 15.69-.8 29.175-4.826 8.052-2.511 16.09-3.969 23.948-4.463 25.726-1.586 45.473 6.911 57.743 17.604 11.416 9.432 22.457 19.879 31.142 19.694 8.571-.115 15.134-11.604 7.032-24.405-8.817-13.18-24.553-26.163-47.588-32.739-19.003-5.465-41.07-5.554-62.318.553z\" style=\"fill:#fff\" transform=\"scale(-1 1) rotate(-40.555 170.67 793.864)\"/></g><path fill=\"none\" d=\"M78.768 499.246c-36.188 0-65.632-29.439-65.632-65.649V79.132c0-36.211 29.443-65.632 65.632-65.632h354.46c36.202 0 65.645 29.421 65.645 65.632v354.465c0 36.21-29.443 65.649-65.645 65.649H78.768z\"/><g><path d=\"M137.141 473.474c29.627 7.798 61.013 10.667 86.881 4.377 48.737-11.859 64.443-28.113 61.93-68.991 0 0 .908-19.719-40.68-18.982-9.21.167-32.732 5.088-36.07 15.193-3.342 10.114 1.719 20.368 1.991 25.324.272 4.956-13.443 11.676-19.206 12.246-7.496.736-26.381-.456-45.438-5.158l-.82-.211c-18.89-5.324-35.903-13.613-42.053-17.955-4.732-3.343-13.342-15.948-10.658-20.132 2.684-4.176 12.149-10.597 14.237-21.035 2.088-10.438-15.934-26.333-23.864-31.026-35.798-21.185-44.75-3.579-44.75-3.579-22.373 34.308-16.737 56.193 19.789 90.57 19.386 18.245 48.101 31.245 77.711 39.097z\" style=\"fill:#c95328\" transform=\"translate(-17.206 -348.277) scale(1.71549)\"/><path d=\"M135.768 478.956c29.632 7.799 61.018 10.667 86.882 4.368 48.741-11.851 64.447-28.104 61.93-68.982 0 0 .912-19.728-40.676-18.982-9.215.167-32.732 5.079-36.074 15.193-3.338 10.114 1.719 20.368 1.996 25.324.272 4.956-13.443 11.676-19.21 12.246-7.491.736-26.382-.456-45.435-5.158l-.82-.21c-18.891-5.325-35.904-13.614-42.057-17.956-4.728-3.343-13.342-15.957-10.658-20.132 2.689-4.176 12.149-10.597 14.241-21.035 2.088-10.447-15.938-26.333-23.868-31.026-35.794-21.185-44.746-3.588-44.746-3.588-22.373 34.307-16.737 56.193 19.79 90.579 19.386 18.236 48.097 31.245 77.71 39.097z\" style=\"fill:#fff\" transform=\"translate(-17.206 -348.277) scale(1.71549)\"/></g><path style=\"opacity:1;vector-effect:none;fill:#fff;fill-opacity:1;stroke:none;stroke-width:.56869441;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1\" d=\"M485.124 226.94H459.78c-1.169 11.72-2.34 18.852-3.12 21.397-1.17 2.551-3.12 3.569-5.459 3.569-5.068 0-9.358-5.605-13.255-17.833-2.344-5.096-5.85-19.87-11.312-43.817C442.233 118.93 453.54 67.47 460.56 34.86h-35.092l-18.327 82.028c-10.138-32.607-19.886-55.536-29.634-68.273-11.309-13.243-26.516-19.87-46.012-20.38-30.022 0-52.642 14.27-67.066 42.29-12.476 23.438-18.716 54.004-18.716 91.71 0 38.208 6.627 69.293 19.885 93.744 14.427 27.006 34.702 40.253 60.829 40.253 29.633 0 55.37-18.343 77.983-56.045 10.918 37.702 24.565 56.045 41.331 56.045 22.23 0 35.095-22.929 39.384-69.292m-93.969-40.251c-12.089 49.42-29.637 73.88-52.253 73.88-37.43 0-55.757-32.61-55.757-98.333 0-67.255 16.38-100.884 49.13-100.884 14.427 0 28.075 16.815 40.164 49.421 7.406 21.402 13.647 46.877 18.714 75.915\"/></svg>" > $pkgdir$linphone_desktop_install_prefix/share/icons/hicolor/scalable/apps/$linphone_alpha_icon_name.svg

    # beta icon to distinguish it is a beta version and not a release version
    echo "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"512\" height=\"512\" xml:space=\"preserve\"><path fill=\"#C95328\" d=\"M512 433.229C512 476.562 476.557 512 433.228 512H78.768C35.452 512 0 476.562 0 433.229V78.763C0 35.43 35.452 0 78.768 0h354.46C476.557 0 512 35.43 512 78.763v354.466z\"/><linearGradient id=\"a\" gradientUnits=\"userSpaceOnUse\" x1=\"256.004\" y1=\"498.877\" x2=\"256.004\" y2=\"13.132\"><stop offset=\"0\" style=\"stop-color:#e6b043\"/><stop offset=\".5\" style=\"stop-color:#c95328\"/></linearGradient><path fill=\"url(#a)\" d=\"M78.768 498.877c-36.188 0-65.632-29.438-65.632-65.648V78.763c0-36.21 29.443-65.631 65.632-65.631h354.46c36.202 0 65.645 29.421 65.645 65.631v354.465c0 36.21-29.443 65.648-65.645 65.648H78.768z\"/><path d=\"M473.412 129.19c4.022 16.057 11.006 21.111 14.433 6.539 2.626-12.988-.907-31.173-15.294-50.564-28.484-41.915-103.78-66.186-162.935-44.793-31.137 11.984-24.661 13.922 7.499 7.175 58.118-10.362 116.214 15.009 141.418 51.351 7.501 10.271 12.299 20.659 14.879 30.292z\" style=\"fill:#c95328\" transform=\"scale(-1 1) rotate(-56.76 136.476 576.306)\"/><path d=\"M419.015 143.098c7.494 14.941 12.717 26.531 19.203 25.729 6.259-.803 15.077-12.937 11.313-29.547-2.509-10.809-8.09-22.524-17.543-33.749-28.203-35.815-93.65-54.292-150.259-31.286-29.453 11.077-49.386 32.979-50.211 36.716-1.109 4.036 18.227-9.882 45.146-18.015 35.711-11.303 76.217-6.516 105.15 11.224 18.366 11.001 30.457 25.282 37.201 38.928z\" style=\"fill:#c95328\" transform=\"scale(-1 1) rotate(-56.76 136.476 576.306)\"/><path d=\"M272.768 116.451c-23.938 6.501-41.564 24.912-39.126 28.578 2.162 3.725 15.671-.811 29.184-4.844 8.038-2.487 16.081-3.953 23.938-4.465 25.749-1.574 45.468 6.943 57.738 17.625 11.416 9.433 22.448 19.878 31.148 19.694 8.566-.117 15.136-11.611 7.022-24.39-8.806-13.192-24.526-26.198-47.588-32.772-19.007-5.462-41.061-5.518-62.316.574z\" style=\"fill:#c95328\" transform=\"scale(-1 1) rotate(-56.76 136.476 576.306)\"/><g><path d=\"M471.9 135.938c4.029 16.063 11.007 21.124 14.451 6.533 2.614-12.977-.917-31.161-15.322-50.563-28.482-41.924-103.761-66.172-162.917-44.792-31.146 11.995-24.653 13.946 7.502 7.184 58.08-10.377 116.211 14.988 141.407 51.347 7.508 10.277 12.302 20.639 14.879 30.291z\" style=\"fill:#fff\" transform=\"scale(-1 1) rotate(-56.76 136.476 576.306)\"/><path d=\"M417.504 149.867c7.505 14.928 12.724 26.518 19.188 25.708 6.278-.797 15.089-12.928 11.332-29.564-2.513-10.809-8.095-22.504-17.548-33.728C402.261 76.469 336.838 58 280.209 81.002c-29.433 11.073-49.345 32.962-50.192 36.706-1.089 4.03 18.224-9.864 45.125-17.983 35.73-11.315 76.235-6.557 105.167 11.199 18.359 11.009 30.453 25.299 37.195 38.943z\" style=\"fill:#fff\" transform=\"scale(-1 1) rotate(-56.76 136.476 576.306)\"/><path d=\"M271.267 123.201c-23.948 6.485-41.572 24.917-39.134 28.582 2.168 3.729 15.69-.8 29.175-4.826 8.052-2.511 16.09-3.969 23.948-4.463 25.726-1.586 45.473 6.911 57.743 17.604 11.416 9.432 22.457 19.879 31.142 19.694 8.571-.115 15.134-11.604 7.032-24.405-8.817-13.18-24.553-26.163-47.588-32.739-19.003-5.465-41.07-5.554-62.318.553z\" style=\"fill:#fff\" transform=\"scale(-1 1) rotate(-56.76 136.476 576.306)\"/></g><path fill=\"none\" d=\"M78.768 499.246c-36.188 0-65.632-29.439-65.632-65.649V79.132c0-36.211 29.443-65.632 65.632-65.632h354.46c36.202 0 65.645 29.421 65.645 65.632v354.465c0 36.21-29.443 65.649-65.645 65.649H78.768z\"/><g><path d=\"M137.141 473.474c29.627 7.798 61.013 10.667 86.881 4.377 48.737-11.859 64.443-28.113 61.93-68.991 0 0 .908-19.719-40.68-18.982-9.21.167-32.732 5.088-36.07 15.193-3.342 10.114 1.719 20.368 1.991 25.324.272 4.956-13.443 11.676-19.206 12.246-7.496.736-26.381-.456-45.438-5.158l-.82-.211c-18.89-5.324-35.903-13.613-42.053-17.955-4.732-3.343-13.342-15.948-10.658-20.132 2.684-4.176 12.149-10.597 14.237-21.035 2.088-10.438-15.934-26.333-23.864-31.026-35.798-21.185-44.75-3.579-44.75-3.579-22.373 34.308-16.737 56.193 19.789 90.57 19.386 18.245 48.101 31.245 77.711 39.097z\" style=\"fill:#c95328\" transform=\"translate(-17.206 -348.277) scale(1.71549)\"/><path d=\"M135.768 478.956c29.632 7.799 61.018 10.667 86.882 4.368 48.741-11.851 64.447-28.104 61.93-68.982 0 0 .912-19.728-40.676-18.982-9.215.167-32.732 5.079-36.074 15.193-3.338 10.114 1.719 20.368 1.996 25.324.272 4.956-13.443 11.676-19.21 12.246-7.491.736-26.382-.456-45.435-5.158l-.82-.21c-18.891-5.325-35.904-13.614-42.057-17.956-4.728-3.343-13.342-15.957-10.658-20.132 2.689-4.176 12.149-10.597 14.241-21.035 2.088-10.447-15.938-26.333-23.868-31.026-35.794-21.185-44.746-3.588-44.746-3.588-22.373 34.307-16.737 56.193 19.79 90.579 19.386 18.236 48.097 31.245 77.71 39.097z\" style=\"fill:#fff\" transform=\"translate(-17.206 -348.277) scale(1.71549)\"/></g><g aria-label=\"β\" style=\"font-style:normal;font-weight:400;font-size:40px;line-height:1.25;font-family:sans-serif;letter-spacing:0;word-spacing:0;fill:#000;fill-opacity:1;stroke:none\"><path d=\"M76.637 168.895c-1.266 48.305-10.53 67.779-10.53 67.779s-23.274-4.046-20.392-102.484c.705-24.071-2.198-72.103-2.198-72.103-1.883-31.083 25.422-46.651 76.265-46.651 51.798 0 77.697 13.13 77.697 39.388 0 18.688-10.265 31.442-30.793 38.262 33.418 6.138 50.127 18.313 50.127 36.523 0 32.329-28.763 48.493-86.29 48.493-25.302 0-43.264-3.069-53.886-9.207zm0-24.554c13.247 11.8 31.627 17.7 55.14 17.7 34.372 0 51.559-10.709 51.559-32.125 0-19.233-27.69-28.1-83.068-26.6V85.926c43.324 0 64.986-10.913 64.986-32.738 0-14.937-13.964-22.405-41.892-22.405-31.15 0-46.725 10.64-46.725 31.92z\" style=\"font-size:325.33334351px;fill:#fff;fill-opacity:1;stroke-width:.85193974\" transform=\"matrix(1.21234 0 0 1.74668 197.76 -13.008)\"/></g></svg>" > $pkgdir$linphone_desktop_install_prefix/share/icons/hicolor/scalable/apps/$linphone_beta_icon_filename

    # Add custom icons for script change-linphone-icon
    # ------------------------------------------------
    
    # Extra icon for change icon script
    echo "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"64\" height=\"64\" version=\"1\">" > $pkgdir$linphone_desktop_install_prefix/share/icons/hicolor/scalable/apps/$linphone_extra_icon_name_one.svg
    echo " <path style=\"opacity:0.2\" d=\"m 32,5 c -0.78188,0 -1.551046,0.039322 -2.316406,0.101562 -6.9222,0.4922802 -12.484081,3.0549814 -17.488282,8.050781 -4.1227994,4.116 -6.6776994,9.194719 -7.6874996,14.511719 -0.09302,0.48592 -0.166654,0.977996 -0.2343748,1.472656 -0.04094,0.30366 -0.086308,0.605516 -0.117188,0.910158 -0.06788,0.65334 -0.106346,1.314268 -0.128906,1.980468 -0.005,0.16788 -0.01362,0.335946 -0.01562,0.503906 C 4.0077188,32.68525 4,32.844 4,33 c 0,15.2532 12.076563,27.570562 27.226562,27.976562 0.11766,0.0034 0.23777,0.01 0.35547,0.0118 C 31.724032,60.991282 31.86,61 32,61 c 0.67422,0 1.341846,-0.03564 2.003906,-0.08204 0.08308,-0.0062 0.16308,-0.0086 0.246094,-0.0156 10.0028,-0.7894 18.473306,-6.796194 22.753906,-15.308594 0,0 0.004,-0.004 0.004,-0.004 0.2769,-0.55108 0.559902,-1.100496 0.800782,-1.671876 1.31076,-2.96 2.022944,-6.102024 2.152344,-9.390624 0.0056,-0.10624 0.0072,-0.213752 0.0118,-0.320312 0.0086,-0.31416 0.02554,-0.624588 0.02344,-0.941408 C 59.995894,33.175624 60,33.09 60,33 V 9.199219 C 60,6.872419 58.127582,5 55.800782,5 H 32.210938 Z\"/>" >> $pkgdir$linphone_desktop_install_prefix/share/icons/hicolor/scalable/apps/$linphone_extra_icon_name_one.svg
    echo " <path style=\"fill:#f57f38\" d=\"m 32,4 c -0.78188,0 -1.551046,0.039322 -2.316406,0.101562 -6.9222,0.4922802 -12.484081,3.0549814 -17.488282,8.050781 -4.1227994,4.116 -6.6776994,9.194719 -7.6874996,14.511719 -0.09302,0.48592 -0.166654,0.977996 -0.2343748,1.472656 -0.04094,0.30366 -0.086308,0.605516 -0.117188,0.910158 -0.06788,0.65334 -0.106346,1.314268 -0.128906,1.980468 -0.005,0.16788 -0.01362,0.335946 -0.01562,0.503906 C 4.0077188,31.68525 4,31.844 4,32 c 0,15.2532 12.076563,27.570562 27.226562,27.976562 0.11766,0.0034 0.23777,0.01 0.35547,0.0118 C 31.724032,59.991282 31.86,60 32,60 c 0.67422,0 1.341846,-0.03564 2.003906,-0.08204 0.08308,-0.0062 0.16308,-0.0086 0.246094,-0.0156 10.0028,-0.7894 18.473306,-6.796194 22.753906,-15.308594 0,0 0.004,-0.004 0.004,-0.004 0.2769,-0.55108 0.559902,-1.100496 0.800782,-1.671876 1.31076,-2.96 2.022944,-6.102024 2.152344,-9.390624 0.0056,-0.10624 0.0072,-0.213752 0.0118,-0.320312 0.0086,-0.31416 0.02554,-0.624588 0.02344,-0.941408 C 59.995894,32.175624 60,32.09 60,32 V 8.1992188 C 60,5.872419 58.127582,4 55.800782,4 H 32.210938 Z\"/>" >> $pkgdir$linphone_desktop_install_prefix/share/icons/hicolor/scalable/apps/$linphone_extra_icon_name_one.svg
    echo " <path style=\"opacity:0.2\" d=\"m 34.747,17.002876 c -0.70276,0 -1.28592,0.561239 -1.29262,1.241349 -0.0042,0.683208 0.5792,1.257729 1.28694,1.261247 3.0544,0.02294 5.5658,0.988176 7.5908,2.891696 2.0012,1.885862 3.0444,4.498728 3.071,7.90837 v 0.003 c 0.0072,0.678268 0.59086,1.23845 1.29546,1.23845 7.4e-5,0 0.0134,-0.0028 0.0142,-0.003 0.70618,-0.0064 1.29264,-0.5758 1.28692,-1.258408 v -0.003 c -0.016,-1.98979 -0.34,-3.817598 -0.972,-5.42543 -0.64,-1.624828 -1.612,-3.062278 -2.88,-4.258152 -2.506,-2.355953 -5.706,-3.573025 -9.39,-3.599022 h -0.0114 z m -13.1192,2.94009 c -0.4928,-0.08374 -1.02662,0.0078 -1.55966,0.264172 h -0.04262 l -0.05968,0.0341 c -0.9876,0.56154 -1.913601,1.314262 -2.781001,2.258362 l -0.06818,0.07386 v 0.06818 c -0.6,0.74812 -0.9968,1.501242 -1.088,2.255562 -0.02912,0.12784 -0.0284,0.243094 -0.0284,0.366442 0,0.343184 0.05044,0.691948 0.15626,1.033992 l 0.0284,0.09658 0.05966,0.0341 c 0.34258,1.175276 1.12,3.004284 2.821001,6.101758 1.13298,2.052984 2.2906,3.767804 3.4404,5.212652 0.60566,0.75936 1.29176,1.549978 2.088,2.346354 0.0094,0.0096 0.04304,0.04376 0.07956,0.0767 0.0126,0.0126 0.03036,0.03888 0.07386,0.0824 l 0.07954,0.07954 h 0.0058 c 0.02802,0.02804 0.04694,0.04838 0.05114,0.05398 l 0.0142,0.017 0.0142,0.0144 c 0.79628,0.787518 1.58166,1.477684 2.3494,2.079382 1.44274,1.149718 3.1574,2.316356 5.2102,3.451438 3.1012,1.7107 4.9474,2.483938 6.1164,2.820702 l 0.04262,0.05114 0.07104,0.02558 c 0.3312,0.1104 0.67584,0.16138 1.01704,0.15624 0.1384,0.0074 0.26094,-0.002 0.37784,-0.0284 0.8007,-0.09362 1.59352,-0.472692 2.3778,-1.130562 l 0.0086,-0.0114 0.0086,-0.0056 c 0.0122,-0.012 0.005,-0.0062 0.0114,-0.0144 0.007,-0.0062 0.01,-0.0136 0.0172,-0.02 0.92836,-0.847212 1.67766,-1.768634 2.2414,-2.755312 l 0.03692,-0.0625 v -0.05966 c 0.5178,-1.078148 0.3127,-2.178772 -0.5284,-2.880498 -0.0206,-0.0176 -0.42474,-0.355462 -0.92614,-0.76412 -0.51276,-0.417796 -1.12088,-0.908904 -1.53146,-1.210152 -0.77684,-0.57462 -1.97752,-1.317902 -2.662,-1.698702 h -0.0028 c -1.31456,-0.736122 -2.6882,-0.308328 -3.2926,0.47439 l -1.05966,1.326582 c -0.42736,0.538422 -1.2813,0.487068 -1.30398,0.485748 -7.1874,-1.848946 -9.1198,-9.075446 -9.1336,-9.126842 -0.0013,-0.02262 -0.05294,-0.877986 0.4858,-1.312382 l 1.32102,-1.056708 c 0.78466,-0.600898 1.2258,-1.974212 0.4858,-3.292254 -0.38604,-0.681428 -1.1326,-1.891062 -1.69886,-2.66172 h -0.0028 c -0.306,-0.412158 -0.796,-1.023694 -1.214,-1.53704 -0.208,-0.256572 -0.398,-0.491348 -0.536,-0.65893 -0.07,-0.0838 -0.126,-0.15138 -0.166,-0.19878 -0.02,-0.0237 -0.03662,-0.04036 -0.0483,-0.05398 -0.0058,-0.0068 -0.009,-0.0114 -0.0142,-0.017 -0.366,-0.434754 -0.832,-0.699526 -1.346,-0.786918 z m 13.196,2.880498 c -0.69314,-0.04888 -1.31594,0.47045 -1.36648,1.1391 -0.05058,0.66939 0.48946,1.266408 1.18182,1.315202 1.71216,0.12098 2.8676,0.624314 3.7358,1.542458 v 0.003 c 0.88622,0.935182 1.28946,2.00319 1.25568,3.462636 v 0.0056 c -0.015,0.671608 0.54838,1.24079 1.24432,1.255508 h 0.0312 c 0.68578,0 1.25746,-0.541304 1.27272,-1.204434 0.0469,-2.00619 -0.60658,-3.796202 -1.9233,-5.184056 -1.326,-1.394652 -3.2,-2.17597 -5.434,-2.334754 z\"/>" >> $pkgdir$linphone_desktop_install_prefix/share/icons/hicolor/scalable/apps/$linphone_extra_icon_name_one.svg
    echo " <path style=\"fill:#ffffff\" d=\"m 34.747,16.002876 c -0.70276,0 -1.28592,0.561239 -1.29262,1.241349 -0.0042,0.683208 0.5792,1.257728 1.28694,1.261246 3.0544,0.02294 5.5658,0.988176 7.5908,2.891697 2.0012,1.885862 3.0444,4.498728 3.071,7.90837 v 0.003 c 0.0072,0.678268 0.59086,1.23845 1.29546,1.23845 7.4e-5,0 0.0134,-0.0028 0.0142,-0.003 0.70618,-0.0064 1.29264,-0.5758 1.28692,-1.258408 v -0.003 c -0.016,-1.98979 -0.34,-3.817598 -0.972,-5.42543 -0.64,-1.624828 -1.612,-3.062278 -2.88,-4.258153 -2.506,-2.355952 -5.706,-3.573024 -9.39,-3.599021 h -0.0114 z m -13.1192,2.940089 c -0.4928,-0.08374 -1.02662,0.0078 -1.55966,0.264172 h -0.04262 l -0.05968,0.0341 c -0.9876,0.56154 -1.913601,1.314263 -2.781001,2.258363 l -0.06818,0.07386 v 0.06818 c -0.6,0.74812 -0.9968,1.501242 -1.088,2.255562 -0.02912,0.12784 -0.0284,0.243094 -0.0284,0.366442 0,0.343184 0.05044,0.691948 0.15626,1.033992 l 0.0284,0.09658 0.05966,0.0341 c 0.34258,1.175276 1.12,3.004284 2.821001,6.101758 1.13298,2.052984 2.2906,3.767804 3.4404,5.212652 0.60566,0.75936 1.29176,1.549978 2.088,2.346354 0.0094,0.0096 0.04304,0.04376 0.07956,0.0767 0.0126,0.0126 0.03036,0.03888 0.07386,0.0824 l 0.07954,0.07954 h 0.0058 c 0.02802,0.02804 0.04694,0.04838 0.05114,0.05398 l 0.0142,0.017 0.0142,0.0144 c 0.79628,0.787518 1.58166,1.477684 2.3494,2.079382 1.44274,1.149718 3.1574,2.316356 5.2102,3.451438 3.1012,1.7107 4.9474,2.483938 6.1164,2.820702 l 0.04262,0.05114 0.07104,0.02558 c 0.3312,0.1104 0.67584,0.16138 1.01704,0.15624 0.1384,0.0074 0.26094,-0.002 0.37784,-0.0284 0.8007,-0.09362 1.59352,-0.472692 2.3778,-1.130562 l 0.0086,-0.0114 0.0086,-0.0056 c 0.0122,-0.012 0.005,-0.0062 0.0114,-0.0144 0.007,-0.0062 0.01,-0.0136 0.0172,-0.02 0.92836,-0.847212 1.67766,-1.768634 2.2414,-2.755312 l 0.03692,-0.0625 v -0.05966 c 0.5178,-1.078148 0.3127,-2.178772 -0.5284,-2.880498 -0.0206,-0.0176 -0.42474,-0.355462 -0.92614,-0.76412 -0.51276,-0.417796 -1.12088,-0.908904 -1.53146,-1.210152 -0.77684,-0.57462 -1.97752,-1.317902 -2.662,-1.698702 h -0.0028 c -1.31456,-0.736122 -2.6882,-0.308328 -3.2926,0.47439 l -1.05966,1.326582 c -0.42736,0.538422 -1.2813,0.487068 -1.30398,0.485748 -7.1874,-1.848946 -9.1198,-9.075446 -9.1336,-9.126842 -0.0013,-0.02262 -0.05294,-0.877986 0.4858,-1.312382 l 1.32102,-1.056708 c 0.78466,-0.600898 1.2258,-1.974212 0.4858,-3.292254 -0.38604,-0.681428 -1.1326,-1.891062 -1.69886,-2.66172 h -0.0028 c -0.306,-0.412158 -0.796,-1.023694 -1.214,-1.53704 -0.208,-0.256572 -0.398,-0.491348 -0.536,-0.658931 -0.07,-0.0838 -0.126,-0.15138 -0.166,-0.19878 -0.02,-0.0237 -0.03662,-0.04036 -0.0483,-0.05398 -0.0058,-0.0068 -0.009,-0.0114 -0.0142,-0.017 -0.366,-0.434754 -0.832,-0.699526 -1.346,-0.786918 z m 13.196,2.880499 c -0.69314,-0.04888 -1.31594,0.47045 -1.36648,1.1391 -0.05058,0.66939 0.48946,1.266408 1.18182,1.315202 1.71216,0.12098 2.8676,0.624314 3.7358,1.542458 v 0.003 c 0.88622,0.935182 1.28946,2.00319 1.25568,3.462636 v 0.0056 c -0.015,0.671608 0.54838,1.24079 1.24432,1.255508 h 0.0312 c 0.68578,0 1.25746,-0.541304 1.27272,-1.204434 0.0469,-2.00619 -0.60658,-3.796202 -1.9233,-5.184056 -1.326,-1.394652 -3.2,-2.17597 -5.434,-2.334754 z\"/>" >> $pkgdir$linphone_desktop_install_prefix/share/icons/hicolor/scalable/apps/$linphone_extra_icon_name_one.svg
    echo " <path style=\"opacity:0.2;fill:#ffffff\" d=\"M 32 4 C 31.21812 4 30.448954 4.0393225 29.683594 4.1015625 C 22.761394 4.5938429 17.199514 7.1565441 12.195312 12.152344 C 8.0725131 16.268344 5.5176127 21.347062 4.5078125 26.664062 C 4.4147925 27.149983 4.3411563 27.642059 4.2734375 28.136719 C 4.2324975 28.440379 4.18713 28.742231 4.15625 29.046875 C 4.08837 29.700215 4.0499037 30.361144 4.0273438 31.027344 C 4.0223438 31.195224 4.0137188 31.36329 4.0117188 31.53125 C 4.007714 31.68525 4 31.844 4 32 C 4 32.121303 4.0101924 32.240032 4.0175781 32.359375 C 4.0210866 32.248684 4.0240493 32.137957 4.0273438 32.027344 C 4.0499037 31.361144 4.08837 30.700215 4.15625 30.046875 C 4.18713 29.742231 4.2324975 29.440379 4.2734375 29.136719 C 4.3411563 28.642059 4.4147925 28.149983 4.5078125 27.664062 C 5.5176127 22.347062 8.0725131 17.268344 12.195312 13.152344 C 17.199514 8.1565441 22.761394 5.5938429 29.683594 5.1015625 C 30.448954 5.0393225 31.21812 5 32 5 L 32.210938 5 L 55.800781 5 C 58.127581 5 60 6.872419 60 9.1992188 L 60 8.1992188 C 60 5.8724189 58.127581 4 55.800781 4 L 32.210938 4 L 32 4 z\"/>" >> $pkgdir$linphone_desktop_install_prefix/share/icons/hicolor/scalable/apps/$linphone_extra_icon_name_one.svg
    echo "</svg>" >> $pkgdir$linphone_desktop_install_prefix/share/icons/hicolor/scalable/apps/$linphone_extra_icon_name_one.svg
    
    # Extra icon for change icon script
    echo "<svg width=\"1000\" height=\"1000\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns=\"http://www.w3.org/2000/svg\"><defs><radialGradient xlink:href=\"#a\" id=\"b\" cx=\"122.991\" cy=\"32.607\" fx=\"122.991\" fy=\"32.607\" r=\"163.8\" gradientTransform=\"matrix(-.01834 1.17214 -1.03732 -.01623 -248.565 166.597)\" gradientUnits=\"userSpaceOnUse\"/><linearGradient id=\"a\"><stop offset=\"0\" stop-color=\"#7f9195\"/><stop offset=\"1\" stop-color=\"#809296\" stop-opacity=\"0\"/></linearGradient></defs><path d=\"M253.71 64.867a500 500 0 01681.354 188.72 500 500 0 01-188.53 681.408 500 500 0 01-681.46-188.34A500 500 0 01253.222 65.144\" fill=\"#00252d\"/><path d=\"M-362.556 49.14a161.017 160.99 0 01219.42 60.763 161.017 160.99 0 01-60.714 219.399 161.017 160.99 0 01-219.453-60.641 161.017 160.99 0 0160.59-219.433\" fill=\"url(#b)\" transform=\"matrix(2.82297 0 0 2.82345 1299.14 -34.067)\"/><path d=\"M612.806 912.636c-7.23-11.437-11.36-61.598-16.32-198.272-4.627-127.425-7.032-157.195-12.704-157.195-5.097 0-6.228 13.198-7.554 88.124-1.374 77.641-2.827 97.139-7.977 107.029-3.913 7.515-6.019 8.366-9.271 3.749-5.105-7.246-6.4-22.062-8.381-95.81-1.315-48.969-2.65-75.277-3.912-77.067-3.847-5.461-5.208 6.373-6.047 52.572-.464 25.545-1.715 50.451-2.78 55.348-3.805 17.508-13.572 16.818-17.032-1.203-1.065-5.545-2.46-32.59-3.1-60.099-1.167-50.174-2.503-60.735-7.682-60.735-6.71 0-9.854 18.831-13.397 80.27C489.454 774.095 485.42 802.49 474.9 802.49c-6.336 0-9.743-7.88-27.027-62.519-16.605-52.489-29.583-73.638-45.19-73.638-13.921 0-13.902-.081-14.539 62.402-.376 36.922-1.177 55.352-2.486 57.207-3.563 5.052-4.705-6.276-8.176-81.104-4.813-103.772-8.684-132.618-16.095-119.942-1.788 3.058-2.517 17.956-3.178 64.932-.868 61.622-2.06 73.151-7.837 75.82-4.286 1.979-5.969-10.778-7.422-56.266-3.087-96.668-7.409-121.294-22.9-130.483-8.71-5.166-10.477-1.667-10.477 20.75 0 21.707-.884 26.102-5.249 26.102-4.036 0-5.908-6.34-8.037-27.213-1.762-17.262-4.774-24.443-9.234-22.014-3.224 1.757-3.562 23.039-.862 54.29 2.216 25.652.668 36.313-5.423 37.339-6.41 1.08-9.401-10.436-13.202-50.814-3.459-36.74-6.332-48.75-11.666-48.75-4.48 0-6.242 5.658-10.14 32.552-3.678 25.38-6.276 32.91-12.811 37.137-6.766 4.376-9.918-3.211-11.336-27.283-1.59-26.98-3.596-36.488-8.971-42.513-8.595-9.632-26.202-2.935-27.55 10.478-.394 3.928-1.677 5.11-5.546 5.11-4.288 0-5.59-1.586-8.801-10.718-4.378-12.451-9.381-19.05-14.454-19.063-1.974-.004-6.034-2.125-9.023-4.712-4.832-4.182-9.01-4.774-37.75-5.35-27.404-.548-32.315-1.19-32.315-4.22 0-3.012 5.126-3.759 32.716-4.763 25.879-.942 33.768-2.002 37.75-5.072 2.768-2.135 7.435-4.615 10.37-5.512 6.117-1.87 8.424-5.194 13.118-18.91 2.498-7.299 4.489-9.99 7.787-10.533 3.682-.606 4.957.802 7.55 8.336 2.686 7.807 4.166 9.344 10.669 11.082 16.254 4.342 21.318-4.262 24.33-41.342 1.17-14.42 3.063-27.815 4.204-29.768 5.751-9.837 15.413 2.928 18.478 24.411a7754.964 7754.964 0 003.622 25.067c2.753 18.76 9.309 24.046 13.966 11.26 1.436-3.94 4.152-22.964 6.037-42.276 4.002-41.002 6.636-51.192 12.954-50.125 6.12 1.035 7.43 10.376 5.37 38.328-2.568 34.857-2.277 51.555.93 53.301 4.46 2.43 7.471-4.752 9.233-22.014 2.13-20.873 4.001-27.212 8.037-27.212 4.365 0 5.249 4.394 5.249 26.102 0 22.417 1.767 25.916 10.477 20.75 15.461-9.171 19.869-34.03 22.948-129.434 1.504-46.577 3.137-59.272 7.374-57.315 5.726 2.644 6.964 14.313 7.893 74.399.965 62.347 2.404 74.962 7.696 67.45 4.188-5.946 7.207-35.239 10.65-103.35 3.94-77.957 5.034-93.938 6.738-98.38 3.083-8.04 4.27 6.173 4.797 57.47.536 52.222.687 54.315 4.148 57.757 1.975 1.964 6.97 3.571 11.097 3.571 15.779 0 27.353-19.93 46.975-80.885 15.124-46.983 18.99-55.406 24.978-54.425 9.772 1.602 13.738 26.7 19.603 124.043 5.445 90.39 7.618 106.53 14.599 108.438 5.561 1.52 6.966-8.802 8.205-60.3.663-27.535 2.061-54.58 3.108-60.099 3.293-17.358 12.618-18.695 16.918-2.426 1.252 4.735 2.39 26.69 2.904 55.975.577 32.932 1.504 49.466 2.93 52.232 4.412 8.568 5.748-4.72 6.77-67.354 1.291-79.178 3.585-103.062 10.245-106.69 5.762-3.14 9.596 4.722 12.594 25.821.944 6.645 2.303 45.842 3.02 87.106 1.301 74.983 2.426 88.125 7.54 88.125 5.671 0 8.072-29.319 12.679-154.814 5.412-147.438 9.084-191.36 16.83-201.312 2.859-3.671 3.228-3.538 5.83 2.1 5.59 12.11 6.44 48.127 3.75 158.722-2.75 113.012-2.399 135.76 2.096 135.76 4.94 0 5.786-12.112 6.821-97.652 1.096-90.475 2.26-104.957 8.573-106.683 3.863-1.056 8.909 7.327 11.338 18.838 4.738 22.449 5.657 41.915 6.73 142.626.62 58.293 1.75 107.908 2.51 110.256.758 2.348 2.23 3.876 3.27 3.397 4.494-2.073 6.345-15.702 8.559-63.006 2.426-51.843 4.689-67.881 9.77-69.27 9.035-2.47 11.194 10.713 12.799 78.166 1.524 64.06 3.174 74.756 11.329 73.402 9.04-1.5 12.097-16.802 15.614-78.165 2.86-49.903 5.968-59.637 13.498-42.276 5.97 13.765 8.408 30.776 10.151 70.857.94 21.614 2.064 41.71 2.497 44.658 1.024 6.977 4.858 6.84 16.075-.573 14.03-9.27 18.998-8.175 45.798 10.1l23.577 16.076 44.46 1.191c38.03 1.019 44.461 1.708 44.461 4.764s-6.431 3.745-44.46 4.763l-44.461 1.191-24 16.393c-22.251 15.199-24.596 16.293-32.182 15.018-4.5-.757-11.224-3.579-14.942-6.271-8.914-6.456-13.319-6.314-14.373.464-.458 2.947-1.561 21.972-2.452 42.276-.89 20.304-2.442 42.276-3.449 48.826-2.249 14.637-8.395 30.659-12.157 31.687-4 1.094-5.709-10.246-8.721-57.89-3.467-54.828-6.876-70.258-15.525-70.258-7.584 0-9.255 11.493-10.738 73.834-1.605 67.454-3.764 80.637-12.799 78.167-4.824-1.32-7.307-16.901-9.037-56.731-2.13-49.01-4.098-68.975-7.24-73.436-6.42-9.113-7.626 6.979-7.671 102.36-.042 87.334-1.581 124.198-6.17 147.757-2.798 14.359-8.833 24.884-12.975 22.628-5.326-2.901-6.468-18.867-7.613-106.42-1.115-85.323-1.982-97.653-6.865-97.653-4.664 0-5.198 29.466-2.376 131.19 3.24 116.793 2.022 158.083-4.904 166.243-1.7 2.003-2.893 1.634-4.88-1.509z\" fill=\"#007082\"/><path d=\"M557.433 860.628c-30.551-8.354-48.706-15.887-75.969-31.522-64.097-36.758-107.271-76.846-178.954-166.158-116-144.529-161.966-284.916-120.724-368.713 5.35-10.87 14.713-24.617 20.806-30.549l11.08-10.785 37.69 48.902c20.73 26.896 49.472 63.92 63.87 82.278l26.18 33.377-4.509 8.722c-6.245 12.079-4.046 36.3 5.069 55.815 12.797 27.399 83.283 121.688 121.569 162.623 9.076 9.705 23.088 21.871 31.138 27.037 12.725 8.167 16.854 9.346 31.637 9.03l17.002-.365 11.292 14.881c87.093 114.773 111.507 147.443 111.507 149.213 0 1.157-8.395 6.032-18.655 10.834-24.575 11.502-59.915 13.614-90.03 5.38zm112.678-33.622c-67.963-87.85-119.736-156.163-119.736-157.99 0-7.295 54.164-48.672 63.715-48.672 1.956 0 8.796 5.953 15.199 13.228 27.513 31.263 110.225 143.008 110.225 148.916 0 7.982-51.944 52.717-60.694 52.27-1.552-.08-5.471-3.568-8.709-7.752zm-381.935-499.2l-63.165-83.604 8.125-6.807c17.38-14.56 42.48-31.7 52.522-35.864l10.521-4.363 27.47 35.828c58.805 76.7 89.046 117.446 92.034 124.005 2.76 6.062 2.008 7.879-6.61 15.947-17.09 16.001-48.013 38.46-52.953 38.46-2.96 0-28.816-31.814-67.944-83.603zm9.544 620.059c-.96-1.553-3.258-2.804-5.107-2.78-2.02.025-1.672 1.135.872 2.78 5.423 3.505 6.4 3.505 4.235 0zm-9.88-3.933c0-.61-1.972-1.867-4.382-2.792-2.512-.964-3.645-.49-2.656 1.11 1.658 2.683 7.037 3.968 7.037 1.682zm-43.757-21.478c-.96-1.553-3.257-2.804-5.107-2.78-2.02.025-1.672 1.135.873 2.78 5.423 3.505 6.4 3.505 4.234 0zm246.48 60.187c2.039-.816 4.473-.716 5.411.223.938.938-.729 1.605-3.705 1.482-3.288-.135-3.957-.804-1.705-1.705z\" opacity=\".345\"/><path d=\"M589.627 838.158c-30.55-8.354-48.706-15.887-75.968-31.521-64.097-36.76-107.272-76.847-178.955-166.16-116-144.528-161.966-284.914-120.723-368.712 5.35-10.87 14.713-24.617 20.806-30.549l11.08-10.784 37.69 48.901c20.73 26.896 49.472 63.92 63.87 82.278l26.18 33.377-4.51 8.722c-6.245 12.079-4.045 36.3 5.07 55.815 12.796 27.399 83.282 121.689 121.568 162.623 9.077 9.705 23.089 21.871 31.138 27.038 12.726 8.167 16.855 9.345 31.638 9.028l17.002-.364 11.291 14.881c87.093 114.773 111.508 147.443 111.508 149.213 0 1.157-8.395 6.032-18.656 10.835-24.575 11.502-59.915 13.613-90.029 5.38zm112.679-33.622c-67.963-87.85-119.736-156.162-119.736-157.99 0-7.295 54.164-48.672 63.714-48.672 1.957 0 8.796 5.953 15.2 13.228 27.513 31.263 110.225 143.008 110.225 148.916 0 7.982-51.944 52.717-60.694 52.27-1.553-.079-5.472-3.568-8.709-7.752zm-381.936-499.2l-63.165-83.604 8.125-6.807c17.38-14.56 42.48-31.7 52.522-35.864l10.522-4.363 27.469 35.828c58.806 76.7 89.046 117.446 92.034 124.006 2.762 6.06 2.008 7.878-6.61 15.947-17.09 16-48.012 38.46-52.953 38.46-2.96 0-28.815-31.815-67.944-83.604z\" fill=\"#e0e0e0\"/><path d=\"M-362.399 49.05a161.017 160.99 0 01219.42 60.764 161.017 160.99 0 01-60.714 219.399 161.017 160.99 0 01-219.453-60.641 161.017 160.99 0 0160.59-219.433\" fill=\"none\" stroke=\"#85969a\" stroke-width=\"5.537\" transform=\"matrix(2.82297 0 0 2.82345 1299.14 -34.067)\"/></svg>" > $pkgdir$linphone_desktop_install_prefix/share/icons/hicolor/scalable/apps/$linphone_extra_icon_name_two.svg
    
    # Extra icon for change icon script
    echo "<svg width=\"999\" height=\"1000\" viewBox=\"0 0 264.319 264.583\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns=\"http://www.w3.org/2000/svg\"><defs><linearGradient id=\"b\"><stop style=\"stop-color:#b3b3b3;stop-opacity:1\" offset=\"0\"/><stop style=\"stop-color:#b3b3b3;stop-opacity:0\" offset=\"1\"/></linearGradient><linearGradient id=\"a\"><stop style=\"stop-color:#f96505;stop-opacity:1\" offset=\"0\"/><stop style=\"stop-color:#f96505;stop-opacity:0\" offset=\"1\"/></linearGradient><linearGradient xlink:href=\"#a\" id=\"f\" x1=\"-72.672\" y1=\"90.417\" x2=\"799.289\" y2=\"946.915\" gradientUnits=\"userSpaceOnUse\" gradientTransform=\"translate(42.114 -21.073) scale(.1311)\"/><linearGradient xlink:href=\"#b\" id=\"c\" x1=\"160.971\" y1=\"100.705\" x2=\"51.612\" y2=\"-9.763\" gradientUnits=\"userSpaceOnUse\"/><filter style=\"color-interpolation-filters:sRGB\" id=\"d\" x=\"-.041\" y=\"-.077\" width=\"1.082\" height=\"1.155\"><feGaussianBlur stdDeviation=\"1.71\"/></filter><filter style=\"color-interpolation-filters:sRGB\" id=\"e\" x=\"-.034\" y=\"-.034\" width=\"1.068\" height=\"1.067\"><feGaussianBlur stdDeviation=\"1.278\"/></filter></defs><g transform=\"matrix(2.11985 0 0 2.11985 -90.43 33.788)\"><rect style=\"fill:#e5e3e2;fill-opacity:1;stroke:url(#c);stroke-width:1.10857;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1\" width=\"118.572\" height=\"118.572\" x=\"45.716\" y=\"-12.819\" ry=\"13.59\"/><path style=\"fill:#926c4f;fill-opacity:1;stroke-width:.411396;filter:url(#d)\" d=\"M117.71 44.782c-.458-2.78.098-9.091.098-23.264v-22.6c.012-1.38 1.65-2.906 3.1-3.246 1.948-.417 15.733-.371 19.115.064 5.776.743 10.536 3.972 12.72 8.628.94 2.003 1.322 4.574 1.294 6.92-.033 2.776-.382 5.719-1.727 8.147-1.346 2.433-2.177 3.864-5.995 5.797-2.78 1.408-6.482 1.733-13.331 1.749l-6.423.014-.199 8.968c-.105 4.735.17 7.97-.203 9.042-.355 1.018-.94 1.58-1.523 1.967-2.626 1.258-6.446.209-6.926-2.186zm22.355-25.664c3.796-1.271 5.527-4.154 5.236-8.721-.134-2.115-.402-2.95-1.341-4.181-1.985-2.602-4.045-3.252-10.87-3.426-3.248-.083-6.068.012-6.267.211-.277.277-.653 14.76-.423 16.276.076.499 12.12.358 13.665-.16zM66.178 47.2c-2.575-.672-7.53-3.35-9.537-5.154-3.435-3.089-4.136-5.67-2.05-7.555 2.098-1.896 3.84-1.483 7.315 1.734 4.11 3.806 9.783 5.033 14.295 3.092 3.71-1.596 5.25-5.819 3.293-9.028-1.204-1.976-1.355-2.074-8.918-5.772-7.419-3.627-9.323-4.816-11.908-7.437-3.094-3.137-4.238-8.402-2.754-12.666 1.87-5.366 6.325-8.672 12.879-9.554 4.375-.589 8.008-.013 11.828 1.875 5.684 2.808 7.825 6.642 5.227 9.354-1.628 1.699-3.252 1.553-5.882-.525-3.132-2.476-5.093-3.238-8.354-3.249-4.779-.015-7.692 2.256-7.696 5.999-.003 3.215.973 4.048 9.959 8.5 11.571 5.733 14.585 8.76 15.039 15.102.399 5.573-2.013 10.14-6.909 13.19-1.479.874-3.028 1.68-4.53 2.041-1.09.256-2.525.408-4.926.467-2.828.07-5.693-.237-6.371-.414zm32.97-.628c-.542-.427-1.087-1.15-1.087-1.763V21.425c0-16.775.135-23.902.468-24.632.647-1.42 2.265-2.152 3.87-2.084 2.05.169 3.892 1.067 3.89 2.547V44.644c-.013.718-.455 1.304-.954 1.736-.851.735-2.036 1.157-3.16 1.18-1.061.023-2.192-.33-3.026-.987z\" transform=\"translate(.35 52.632)\"/><path style=\"fill:#f96505;stroke-width:.411396\" d=\"M120.315 43.165c-.458-2.78.098-9.092.098-23.264v-22.6c.012-1.381 1.65-2.906 3.1-3.246 1.948-.418 15.733-.372 19.115.063 5.776.743 10.536 3.972 12.72 8.629.94 2.003 1.322 4.573 1.294 6.92-.033 2.776-.382 5.718-1.727 8.147-1.346 2.432-2.177 3.863-5.995 5.797-2.78 1.407-6.482 1.733-13.331 1.748l-6.423.015-.199 8.968c-.105 4.734.17 7.969-.203 9.041-.356 1.018-.94 1.58-1.523 1.968-2.626 1.258-6.446.209-6.926-2.186zM142.67 17.5c3.796-1.271 5.527-4.153 5.236-8.72-.134-2.116-.402-2.95-1.341-4.181-1.985-2.603-4.045-3.252-10.87-3.426-3.248-.083-6.068.012-6.267.21-.277.278-.653 14.76-.423 16.277.076.498 12.12.358 13.665-.16zM68.783 45.584c-2.575-.672-7.53-3.35-9.537-5.154-3.435-3.09-4.136-5.67-2.05-7.555 2.098-1.897 3.84-1.484 7.315 1.734 4.11 3.805 9.783 5.032 14.295 3.091 3.71-1.596 5.25-5.818 3.293-9.028-1.204-1.975-1.355-2.073-8.918-5.771-7.419-3.627-9.323-4.817-11.908-7.437-3.094-3.137-4.238-8.403-2.754-12.666 1.87-5.367 6.325-8.673 12.879-9.555 4.375-.588 8.008-.012 11.828 1.875 5.684 2.809 7.825 6.642 5.227 9.355-1.628 1.698-3.252 1.553-5.882-.526C79.439 1.472 77.478.709 74.217.699c-4.779-.016-7.692 2.255-7.696 5.998-.003 3.216.973 4.049 9.959 8.5 11.571 5.734 14.585 8.76 15.039 15.102.399 5.574-2.013 10.14-6.909 13.19-1.479.875-3.028 1.68-4.53 2.042-1.09.256-2.525.407-4.926.466-2.828.07-5.693-.236-6.371-.413zm32.97-.628c-.542-.427-1.087-1.15-1.087-1.763V19.808c0-16.776.135-23.902.468-24.633.647-1.419 2.265-2.151 3.87-2.084 2.05.17 3.892 1.068 3.89 2.548v47.387c-.013.718-.455 1.304-.954 1.736-.851.736-2.036 1.158-3.16 1.181-1.061.023-2.192-.331-3.026-.987z\" transform=\"translate(.35 52.632)\"/><g style=\"filter:url(#e)\"><path style=\"fill:#767676;fill-opacity:1;stroke-width:.264583\" d=\"M148.296 88.143c-4.625-.986-8.024-2.22-13.494-4.898-9.551-4.676-16.957-9.95-24.842-17.689-12.098-11.874-20.957-26.24-24.175-39.2-.755-4.248-1.324-9.231-.028-12.859 1.015-2.81 2.135-4.278 7.205-9.435 4.01-4.078 4.86-4.813 6.43-5.556 1.572-.745 2.086-.857 3.937-.857 1.92 0 2.322.096 4.1.975 1.793.886 2.593 1.6 8.744 7.806 5.94 5.992 6.882 7.056 7.67 8.67.78 1.599.898 2.1.895 3.836-.003 1.701-.131 2.27-.872 3.845-.733 1.561-1.481 2.466-4.815 5.825l-3.947 3.976L116.45 35c4.453 8.003 14.468 17.918 22.535 22.311l2.066 1.125 3.887-3.818c2.138-2.1 4.304-4.068 4.813-4.374 1.534-.923 3.882-1.48 5.588-1.324 3.131.284 3.933.875 11.662 8.605 6.376 6.377 7.148 7.244 7.937 8.916.765 1.621.874 2.118.871 3.981-.006 3.458-.787 4.74-6.317 10.36-5.043 5.124-6.44 6.188-9.54 7.267-1.908.665-2.477.74-5.438.729-2.424-.01-4.086-.18-6.218-.635zm8.474-4.925c2.75-.508 3.829-1.274 8.42-5.971 2.35-2.404 4.476-4.748 4.725-5.207.555-1.027.589-2.04.107-3.16-.314-.728-12.27-12.922-13.789-14.063-.648-.488-2.427-.517-3.262-.053-.34.188-2.439 2.141-4.666 4.34-2.226 2.2-4.449 4.244-4.939 4.543-1.434.875-2.804.72-5.46-.618-10.012-5.04-21.877-16.736-26.92-26.535-1.456-2.83-1.755-3.846-1.536-5.214.147-.921.707-1.593 4.53-5.434 2.399-2.411 4.582-4.741 4.852-5.178.559-.905.626-2.37.148-3.23-.179-.322-3.253-3.557-6.832-7.189-9.09-9.224-8.427-9.13-15.35-2.193-2.615 2.62-4.896 5.14-5.19 5.733-.921 1.865-1.206 3.701-1.042 6.72.676 12.455 12.644 32.242 27.038 44.7 6.718 5.816 12.736 9.775 20.53 13.507 4.58 2.193 7.492 3.246 10.987 3.972 4.058.843 5.44.939 7.649.53z\" transform=\"rotate(134.898 120.432 29.247)\"/></g><g><path style=\"fill:#b7b7b7;stroke-width:.264583\" d=\"M111.077 90.78c-4.625-.986-8.025-2.22-13.494-4.897-9.551-4.677-16.957-9.95-24.842-17.69-12.098-11.874-20.957-26.24-24.175-39.2-.755-4.248-1.324-9.231-.028-12.858 1.015-2.812 2.135-4.278 7.205-9.436 4.01-4.078 4.86-4.812 6.43-5.556C63.744.398 64.258.287 66.11.287c1.92 0 2.322.095 4.1.975 1.793.885 2.593 1.6 8.744 7.805 5.94 5.992 6.882 7.056 7.67 8.67.78 1.599.898 2.1.895 3.836-.003 1.702-.132 2.27-.872 3.845-.733 1.561-1.482 2.466-4.815 5.825l-3.947 3.976 1.346 2.418c4.453 8.003 14.468 17.918 22.535 22.311l2.066 1.125 3.887-3.817c2.138-2.1 4.304-4.069 4.813-4.375 1.534-.923 3.882-1.479 5.588-1.324 3.131.284 3.932.875 11.662 8.605 6.376 6.378 7.148 7.244 7.937 8.916.765 1.621.874 2.118.871 3.982-.006 3.457-.787 4.738-6.317 10.358-5.043 5.126-6.44 6.19-9.54 7.268-1.908.665-2.477.741-5.438.729-2.424-.01-4.086-.18-6.218-.635zm8.473-4.924c2.75-.509 3.83-1.274 8.421-5.972 2.35-2.404 4.476-4.747 4.724-5.207.555-1.027.59-2.04.108-3.16-.314-.728-12.27-12.922-13.789-14.063-.649-.487-2.427-.516-3.262-.053-.34.188-2.44 2.142-4.666 4.34-2.226 2.2-4.449 4.244-4.939 4.543-1.434.875-2.804.72-5.46-.618-10.013-5.04-21.877-16.736-26.92-26.535-1.456-2.83-1.755-3.846-1.537-5.214.148-.92.708-1.593 4.53-5.434 2.4-2.411 4.583-4.741 4.853-5.178.559-.905.626-2.37.148-3.23-.179-.322-3.253-3.557-6.832-7.188-9.09-9.225-8.427-9.13-15.35-2.194-2.615 2.62-4.896 5.14-5.19 5.733-.921 1.865-1.206 3.701-1.043 6.72.677 12.456 12.645 32.242 27.04 44.701 6.717 5.815 12.735 9.774 20.529 13.506 4.58 2.193 7.492 3.246 10.987 3.972 4.058.843 5.44.939 7.648.53z\" transform=\"rotate(134.898 104.322 36.735)\"/><path style=\"fill:url(#f);fill-opacity:1;stroke-width:.185406\" d=\"M116.862 87.458c-3.685-.372-7.609-1.48-11.776-3.336-7.023-3.128-13.963-6.094-19.734-10.564-14.341-11.109-27.083-27.7-31.865-42.365-1.213-3.72-1.911-6.68-2.032-9.944-.114-3.077.109-4.542.937-6.166.961-1.884 11.155-11.985 12.91-12.86 2.115-1.053 2.78-.67 8.308 4.782 2.384 2.351 5.529 5.543 6.99 7.094 2.92 3.1 3.558 5.021 3.137 6.592-.267 1-.366 1.116-5.31 6.243-2.167 2.248-4.158 4.409-4.424 4.8-.97 1.429-1.01 1.918.953 5.548 5.706 10.555 18.418 22.85 28.668 27.728 1.483.706.383.479 1.753.482 1.91.005 1.95-.022 6.506-4.412 5.555-5.353 5.684-5.462 6.64-5.605 1.596-.24 3.354.25 5.695 2.456 2.369 2.232 11.002 11.093 12.037 12.355.748.912.962 2.015.601 3.107-.27.817-1.88 2.693-5.466 6.369-2.711 2.778-6.828 6.174-8.052 6.799-1.495.762-4.158 1.131-6.476.897z\" transform=\"rotate(134.898 104.322 36.735)\"/></g></g></svg>" > $pkgdir$linphone_desktop_install_prefix/share/icons/hicolor/scalable/apps/$linphone_extra_icon_name_three.svg
    
    # Extra icon for change icon script
    echo "<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" width=\"25.6\" height=\"25.6\"><defs><linearGradient id=\"a\"><stop style=\"stop-color:#79f36e;stop-opacity:.99607843\" offset=\"0\"/><stop style=\"stop-color:#22e01c;stop-opacity:1\" offset=\"1\"/></linearGradient><linearGradient xlink:href=\"#a\" id=\"b\" gradientUnits=\"userSpaceOnUse\" x1=\"13.017\" y1=\"0\" x2=\"12.475\" y2=\"25.546\"/></defs><path style=\"fill:url(#b);stroke-width:1;font-variant-east_asian:normal;opacity:1;vector-effect:none;fill-opacity:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1\" d=\"M9.643 25.196c-2.272-.595-4.127-1.672-5.845-3.392-5.037-5.044-5.044-12.763-.016-17.803C5.413 2.365 6.987 1.423 9.5.579c3.982-1.337 8.913.036 12.328 3.432 2.578 2.566 3.925 6.01 3.709 9.489-.205 3.296-1.41 5.975-3.735 8.304-3.238 3.243-7.835 4.525-12.159 3.392z\"/><path style=\"fill:#174f14;stroke-width:.2\" d=\"M13.59 19.268c-1.757-.88-3.884-2.903-5.221-4.968C7.164 12.439 6.8 11.437 6.8 9.976c0-1.368.393-2.384 1.152-2.981.849-.668 1.313-.51 2.531.855 1.306 1.464 1.403 2 .517 2.85-.33.316-.6.718-.6.892 0 .398 1.235 2.302 2.034 3.136.332.346.906.792 1.278.992.668.36.683.359 1.308-.103 1.194-.883 1.91-.513 3.501 1.805.423.617.462.796.267 1.225-.342.75-1.563 1.353-2.738 1.353-.747 0-1.363-.183-2.46-.732Z\"/></svg>" > $pkgdir$linphone_desktop_install_prefix/share/icons/hicolor/scalable/apps/$linphone_extra_icon_name_four.svg
    
    # Extra icon for change icon script
    echo "<svg width=\"999\" height=\"1000\" viewBox=\"0 0 264.319 264.583\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns=\"http://www.w3.org/2000/svg\"><defs><linearGradient id=\"b\"><stop style=\"stop-color:#b3b3b3;stop-opacity:1\" offset=\"0\"/><stop style=\"stop-color:#b3b3b3;stop-opacity:0\" offset=\"1\"/></linearGradient><linearGradient id=\"a\"><stop style=\"stop-color:#f96505;stop-opacity:1\" offset=\"0\"/><stop style=\"stop-color:#f96505;stop-opacity:0\" offset=\"1\"/></linearGradient><linearGradient xlink:href=\"#a\" id=\"d\" x1=\"-72.672\" y1=\"90.417\" x2=\"799.289\" y2=\"946.915\" gradientUnits=\"userSpaceOnUse\" gradientTransform=\"matrix(.27792 0 0 .27792 -1.154 -10.884)\"/><linearGradient xlink:href=\"#b\" id=\"c\" x1=\"160.971\" y1=\"100.705\" x2=\"51.612\" y2=\"-9.763\" gradientUnits=\"userSpaceOnUse\" gradientTransform=\"matrix(2.11985 0 0 2.11985 -90.43 33.788)\"/></defs><rect style=\"fill:#e5e3e2;fill-opacity:1;stroke:url(#c);stroke-width:2.35;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1\" width=\"251.354\" height=\"251.354\" x=\"6.482\" y=\"6.615\" ry=\"58.194\"/><path style=\"fill:#f96505;stroke-width:.560875\" d=\"M191.569 95.947c-.624-3.79.133-12.394.133-31.716V33.42c.017-1.884 2.25-3.963 4.228-4.426 2.654-.57 21.449-.507 26.06.087 7.873 1.013 14.363 5.415 17.342 11.763 1.28 2.73 1.802 6.235 1.763 9.434-.045 3.785-.52 7.797-2.354 11.108-1.835 3.316-2.968 5.267-8.173 7.903-3.79 1.919-8.838 2.362-18.176 2.383l-8.756.02-.271 12.227c-.143 6.454.232 10.865-.278 12.327-.484 1.388-1.281 2.154-2.076 2.682-3.58 1.715-8.788.285-9.442-2.98zm30.477-34.989c5.176-1.733 7.536-5.663 7.14-11.89-.184-2.883-.55-4.021-1.83-5.7-2.706-3.547-5.514-4.432-14.82-4.67-4.427-.113-8.272.017-8.543.288-.378.377-.89 20.121-.576 22.19.103.68 16.522.488 18.63-.218zM121.312 99.245c-3.51-.915-10.265-4.566-13.001-7.026-4.684-4.211-5.64-7.731-2.796-10.3 2.86-2.586 5.236-2.023 9.974 2.364 5.604 5.188 13.338 6.86 19.49 4.214 5.056-2.175 7.156-7.932 4.489-12.308-1.642-2.693-1.849-2.827-12.159-7.868-10.114-4.945-12.71-6.567-16.235-10.14-4.217-4.276-5.778-11.455-3.754-17.267 2.548-7.317 8.623-11.824 17.558-13.026 5.964-.803 10.918-.018 16.126 2.556 7.749 3.828 10.669 9.055 7.125 12.753-2.218 2.316-4.433 2.118-8.019-.717-4.27-3.374-6.942-4.414-11.388-4.428-6.516-.021-10.488 3.075-10.492 8.178-.004 4.384 1.326 5.52 13.576 11.589 15.776 7.816 19.885 11.943 20.504 20.589.543 7.598-2.744 13.823-9.42 17.982-2.015 1.192-4.127 2.291-6.176 2.783-1.485.35-3.441.556-6.715.637-3.856.095-7.761-.323-8.687-.565zm44.951-.856c-.74-.582-1.483-1.567-1.483-2.403V64.104c0-22.87.185-32.587.639-33.583.881-1.934 3.087-2.933 5.277-2.84 2.795.23 5.305 1.455 5.302 3.472V95.76c-.017.979-.62 1.778-1.301 2.367-1.16 1.002-2.775 1.578-4.308 1.61-1.446.03-2.989-.452-4.126-1.347z\"/><path style=\"fill:#b7b7b7;stroke-width:.560875\" d=\"M145.037 226.229c-9.804-2.09-17.01-4.706-28.605-10.383-20.248-9.913-35.947-21.092-52.662-37.499-25.645-25.171-44.425-55.624-51.246-83.096-1.601-9.008-2.808-19.57-.06-27.26 2.151-5.96 4.526-9.069 15.274-20.001 8.5-8.646 10.301-10.203 13.629-11.778 3.334-1.58 4.422-1.816 8.346-1.816 4.07 0 4.923.202 8.694 2.066 3.798 1.878 5.495 3.392 18.535 16.546C89.533 65.71 91.529 67.966 93.2 71.387c1.655 3.39 1.903 4.451 1.897 8.132-.005 3.608-.278 4.813-1.847 8.152-1.556 3.309-3.141 5.227-10.208 12.347l-8.366 8.43 2.852 5.125c9.44 16.965 30.67 37.984 47.77 47.296l4.38 2.385 8.24-8.093c4.532-4.45 9.124-8.624 10.203-9.273 3.252-1.956 8.229-3.135 11.846-2.807 6.637.602 8.336 1.855 24.72 18.242 13.518 13.519 15.154 15.356 16.827 18.9 1.622 3.437 1.853 4.49 1.846 8.44-.012 7.33-1.668 10.046-13.391 21.96-10.69 10.864-13.65 13.119-20.222 15.406-4.046 1.409-5.253 1.57-11.53 1.544-5.137-.021-8.66-.38-13.18-1.344zm17.962-10.44c5.829-1.078 8.118-2.7 17.85-12.659 4.982-5.096 9.489-10.064 10.016-11.039 1.176-2.176 1.25-4.325.228-6.697-.665-1.544-26.01-27.393-29.23-29.812-1.376-1.033-5.147-1.095-6.917-.113-.719.399-5.17 4.54-9.89 9.202-4.719 4.663-9.43 8.996-10.47 9.63-3.04 1.853-5.944 1.525-11.575-1.31-21.224-10.686-46.376-35.479-57.064-56.25-3.088-6-3.723-8.154-3.259-11.055.312-1.951 1.5-3.376 9.603-11.519 5.086-5.11 9.714-10.05 10.286-10.975 1.186-1.92 1.328-5.025.315-6.849-.38-.682-6.897-7.539-14.483-15.237-19.27-19.555-17.864-19.354-32.54-4.65-5.543 5.553-10.38 10.896-11 12.153-1.955 3.954-2.56 7.846-2.212 14.244 1.434 26.405 26.804 68.349 57.318 94.76 14.241 12.328 26.998 20.72 43.52 28.63 9.708 4.65 15.883 6.882 23.291 8.42 8.602 1.788 11.533 1.991 16.213 1.126z\" transform=\"rotate(-9.22 272.26 25.296)\"/><path style=\"fill:url(#d);fill-opacity:1;stroke-width:.393032\" d=\"M157.3 219.186c-7.812-.79-16.129-3.138-24.964-7.073-14.886-6.63-29.598-12.917-41.832-22.393-30.402-23.549-57.412-58.721-67.548-89.807-2.572-7.886-4.052-14.163-4.309-21.08-.241-6.523.23-9.63 1.987-13.072 2.037-3.993 23.648-25.406 27.367-27.26 4.483-2.233 5.894-1.42 17.612 10.137 5.053 4.984 11.72 11.75 14.816 15.037 6.19 6.573 7.543 10.645 6.652 13.976-.567 2.12-.776 2.366-11.255 13.234-4.595 4.765-8.816 9.344-9.38 10.175-2.055 3.028-2.142 4.064 2.02 11.76 12.096 22.374 39.044 48.438 60.772 58.78 3.143 1.496.811 1.014 3.717 1.021 4.05.01 4.134-.046 13.791-9.353 11.776-11.348 12.048-11.578 14.075-11.882 3.383-.507 7.11.53 12.073 5.207 5.02 4.73 23.323 23.516 25.517 26.19 1.586 1.933 2.038 4.272 1.274 6.588-.572 1.732-3.986 5.709-11.588 13.5-5.747 5.889-14.474 13.088-17.069 14.412-3.168 1.617-8.815 2.399-13.728 1.903z\" transform=\"rotate(-9.22 272.26 25.296)\"/></svg>" > $pkgdir$linphone_desktop_install_prefix/share/icons/hicolor/scalable/apps/$linphone_extra_icon_name_five.svg

    # Extra icon for change icon script
    echo "<svg width=\"481.882\" height=\"481.882\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns=\"http://www.w3.org/2000/svg\"><defs><linearGradient id=\"a\"><stop style=\"stop-color:#02c1ce;stop-opacity:1\" offset=\"0\"/><stop style=\"stop-color:#007bb1;stop-opacity:1\" offset=\"1\"/></linearGradient><linearGradient xlink:href=\"#a\" id=\"b\" x1=\"947.485\" y1=\"582.931\" x2=\"943.259\" y2=\"949.386\" gradientUnits=\"userSpaceOnUse\" gradientTransform=\"translate(-567.36 -83.08) scale(1.0201)\"/><filter style=\"color-interpolation-filters:sRGB\" id=\"c\" x=\"-.032\" y=\"-.032\" width=\"1.063\" height=\"1.063\"><feGaussianBlur stdDeviation=\"4.382\"/></filter><filter style=\"color-interpolation-filters:sRGB\" id=\"d\" x=\"-.055\" y=\"-.054\" width=\"1.111\" height=\"1.109\"><feGaussianBlur stdDeviation=\"5.708\"/></filter></defs><path style=\"fill:url(#b);fill-opacity:1;stroke:none;stroke-width:4.25603;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;stop-color:#000\" d=\"M212.53 886.092c-2.314-.287-3.156-.938-3.693-2.853-.902-3.217-.913-370.993-.01-374.204.376-1.34 1.414-2.788 2.307-3.217.893-.43 85.493-.914 188-1.077l186.375-.296 2.192 2.06 2.19 2.058v375.322l-2.051 1.438c-1.842 1.29-20.964 1.422-187.182 1.289-101.822-.081-186.48-.315-188.128-.52z\" transform=\"matrix(1.09242 0 0 1.09242 -194.173 -517.876)\"/><path style=\"mix-blend-mode:normal;fill:#fff;fill-opacity:1;stroke:#000;stroke-width:4.61;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;filter:url(#c);stop-color:#000\" d=\"m195.841 880.711-.247-185.077c-.226-169.958.09-189.574.09-189.574.255-10.059 3.573-13.811 14.047-13.993l187.826-.056c142.25-.042 188.244-.218 188.244-.218 10.184.143 14.928 6.511 14.927 14.442 0 0 .108 46.773.092 189.051-.02 183.68.278 183.175.278 183.175-.335 11.652-5.66 18.735-17.906 18.976l-184.625-.034c-179.734-.032-188.152.049-188.152.049-9.958-.017-14.434-5.755-14.574-16.74zm388.134-.518 2.385-1.875V510.926l-2.222-2.221-2.22-2.222H398.155c-182.555 0-183.774.012-185.572 1.81-1.798 1.798-1.81 3.017-1.81 185.983s.012 184.185 1.81 185.983c1.798 1.798 3.017 1.81 185.408 1.81h183.599z\" transform=\"matrix(1.09242 0 0 1.09242 -194.173 -517.876)\"/><path style=\"fill:#fff;fill-opacity:1;stroke:none;stroke-width:4.61;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;stop-color:#000\" d=\"m195.841 880.711-.247-185.077c-.226-169.958.13-188.846.13-188.846.044-11.287 10.72-14.742 17.313-14.768l184.52-.009c63.212-.151 125.28.233 188.12.392 11.124.026 15.068 3.615 15 13.808-.195 62.036.147 136.351.143 189.075-.015 139.409-.07 183.783-.07 183.783 0 11.82-7.204 17.75-17.558 18.368l-184.625-.034c-179.734-.032-187.198-.076-187.198-.076-11.691.258-15.331-8.15-15.528-16.616zm390.519-2.393V510.926c-.121-3.114-.933-4.364-4.443-4.443H398.156c-182.555 0-183.774.012-185.572 1.81-1.798 1.798-1.81 3.017-1.81 185.983s.012 184.185 1.81 185.983c1.798 1.798 3.017 1.81 185.409 1.81H581.59c4.51-.015 4.715-1.916 4.769-3.751z\" transform=\"matrix(1.09242 0 0 1.09242 -194.173 -517.876)\"/><g transform=\"matrix(1.09242 0 0 1.09242 -600.37 -48.77)\" style=\"fill:none;stroke:#000;stroke-opacity:1;filter:url(#d)\"><path style=\"fill:none;fill-opacity:1;stroke:#000;stroke-width:4.17217;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;stop-color:#000\" d=\"M676.054 402.388c-13.968-5.067-29.395-15.067-36.86-23.895-13.253-15.671-16.742-27.43-15.767-53.136.791-20.857 4.41-34.9 14.105-54.754 15.364-31.458 45.984-66.578 90.109-103.35 34.414-28.68 65.45-45.845 92.827-51.34 10.45-2.098 25.546-2.759 33.26-1.456 20.71 3.497 42.888 25.386 54.458 53.746l3.376 8.277-7.34 5.404c-52.855 38.905-69.963 51.16-71.422 51.16-.956 0-4.683-2.952-8.282-6.561-7.937-7.957-13.283-18.158-18.144-34.617-1.764-5.974-3.382-11.352-3.594-11.952-.553-1.559-6.127.491-18.926 6.96-32.035 16.192-55.945 38.303-74.996 69.353-7.755 12.639-20.457 38.79-19.37 39.877.247.247 4.184 1.258 8.75 2.248 10.295 2.232 15.028 4.232 22.315 9.432 6.035 4.306 16.323 15.738 17.158 19.066.387 1.543-4.217 8.403-20.968 31.24-25.889 35.293-34.061 45.941-35.258 45.94-.498 0-2.942-.74-5.43-1.642zM801.4 354.77v-49.324h12.671v98.648H801.4zM842.127 354.77v-49.324l12.896.03c16.143.039 30.32 1.284 34.5 3.03 4.438 1.855 11.198 8.861 13.467 13.958 1.468 3.297 1.89 6.077 1.883 12.396-.011 10.302-2.238 15.968-8.482 21.582-5.947 5.346-11.22 6.85-28.245 8.05l-14.254 1.005v38.598h-11.765zm40.423-2.992c4.719-2.434 7.225-5.901 8.614-11.917 1.317-5.708.049-13.104-2.976-17.352-3.53-4.959-7.777-6.16-21.852-6.183l-12.444-.02v38.244l12.444-.414c10.432-.347 13.054-.728 16.214-2.358z\"/></g><g style=\"fill:#fff\"><path style=\"fill:#fff;fill-opacity:1;stroke:none;stroke-width:4.17217;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;stop-color:#000\" d=\"M676.054 402.388c-13.968-5.067-29.395-15.067-36.86-23.895-13.253-15.671-16.742-27.43-15.767-53.136.791-20.857 4.41-34.9 14.105-54.754 15.364-31.458 45.984-66.578 90.109-103.35 34.414-28.68 65.45-45.845 92.827-51.34 10.45-2.098 25.546-2.759 33.26-1.456 20.71 3.497 42.888 25.386 54.458 53.746l3.376 8.277-7.34 5.404c-52.855 38.905-69.963 51.16-71.422 51.16-.956 0-4.683-2.952-8.282-6.561-7.937-7.957-13.283-18.158-18.144-34.617-1.764-5.974-3.382-11.352-3.594-11.952-.553-1.559-6.127.491-18.926 6.96-32.035 16.192-55.945 38.303-74.996 69.353-7.755 12.639-20.457 38.79-19.37 39.877.247.247 4.184 1.258 8.75 2.248 10.295 2.232 15.028 4.232 22.315 9.432 6.035 4.306 16.323 15.738 17.158 19.066.387 1.543-4.217 8.403-20.968 31.24-25.889 35.293-34.061 45.941-35.258 45.94-.498 0-2.942-.74-5.43-1.642zM801.4 354.77v-49.324h12.671v98.648H801.4zM842.127 354.77v-49.324l12.896.03c16.143.039 30.32 1.284 34.5 3.03 4.438 1.855 11.198 8.861 13.467 13.958 1.468 3.297 1.89 6.077 1.883 12.396-.011 10.302-2.238 15.968-8.482 21.582-5.947 5.346-11.22 6.85-28.245 8.05l-14.254 1.005v38.598h-11.765zm40.423-2.992c4.719-2.434 7.225-5.901 8.614-11.917 1.317-5.708.049-13.104-2.976-17.352-3.53-4.959-7.777-6.16-21.852-6.183l-12.444-.02v38.244l12.444-.414c10.432-.347 13.054-.728 16.214-2.358z\" transform=\"matrix(1.09242 0 0 1.09242 -600.37 -48.77)\"/></g></svg>" > $pkgdir$linphone_desktop_install_prefix/share/icons/hicolor/scalable/apps/$linphone_extra_icon_name_six.svg

    # Copy orange icon to become standard icon
    cp $pkgdir$linphone_desktop_install_prefix/share/icons/hicolor/scalable/apps/$linphone_extra_icon_filename_one $pkgdir$system_scalable_hicolor_icons_prefix/$linphone_desktop_icon_filename

    if $ISRELEASE; then
        echo "Copy standard icon to become standard icon"
        cp $pkgdir$linphone_desktop_install_prefix/share/icons/hicolor/scalable/apps/$linphone_standard_icon_filename $pkgdir$system_scalable_hicolor_icons_prefix/$linphone_desktop_icon_filename
    else
        if [ "$linphone_desktop_alphabeta" == "alpha" ]; then
            echo "yes - it is alpha release"
            echo "Copy alpha icon to become standard icon"
            cp -v $pkgdir$linphone_desktop_install_prefix/share/icons/hicolor/scalable/apps/$linphone_alpha_icon_filename $pkgdir$system_scalable_hicolor_icons_prefix/$linphone_desktop_icon_filename
        elif [ "$linphone_desktop_alphabeta" == "beta" ]; then
            echo "yes - it is beta release"
            echo "Copy beta icon to become standard icon"
            cp -v $pkgdir$linphone_desktop_install_prefix/share/icons/hicolor/scalable/apps/$linphone_beta_icon_filename $pkgdir$system_scalable_hicolor_icons_prefix/$linphone_desktop_icon_filename
        fi
    fi

    cd $pkgdir$linphone_desktop_install_share_prefix/applications

    

    # Make .desktop file
    echo "[Desktop Entry]" > $menuFullFilePathOne
    echo "Encoding=UTF-8" >> $menuFullFilePathOne
    echo "Name=$TITLE" >> $menuFullFilePathOne
    echo "Name[fr]=$TITLE" >> $menuFullFilePathOne
    echo "Name[sv]=$TITLE" >> $menuFullFilePathOne
    echo "Name[cs]=$TITLE" >> $menuFullFilePathOne
    echo "GenericName=SIP Phone" >> $menuFullFilePathOne
    echo "Comment=A libre SIP client" >> $menuFullFilePathOne
    echo "Comment[sv]=En fri SIP-telefon-klient" >> $menuFullFilePathOne
    echo "Comment[fr]=Un libre SIP-client" >> $menuFullFilePathOne
    echo "Comment[cs]=Libre SIP-klient" >> $menuFullFilePathOne
    echo "Type=Application" >> $menuFullFilePathOne
    echo "Icon=$linphone_desktop_icon_name" >> $menuFullFilePathOne
    echo "Terminal=false" >> $menuFullFilePathOne
    echo "Exec=$linphone_desktop_install_prefix/bin/linphone 'call sip-address=%u'" >> $menuFullFilePathOne
    # Using a launcher to set library path
    #echo "Exec=$linphone_desktop_install_scripts_prefix/$executable_tag_lowercase 'call sip-address=%u'" >> $menuFullFilePathOne
    echo "MimeType=x-scheme-handler/sip;x-scheme-handler/sip-linphone;x-scheme-handler/sips-linphone;x-scheme-handler/sips;x-scheme-handler/tel;x-scheme-handler/callto;x-scheme-handler/linphone-config;" >> $menuFullFilePathOne
    echo "X-PulseAudio-Properties=media.role=phone" >> $menuFullFilePathOne
    echo "StartupWMClass=linphone;linphone" >> $menuFullFilePathOne
    echo "Categories=Application;Network;Telephony;Internet" >> $menuFullFilePathOne
    #chmod +x $menuFullFilePathOne
    #ls -lrt -d -1 "$$(PWD)"/{*,.*}
    mkdir -p -v $pkgdir$linphone_desktop_install_prefix/share/applications
    cp -v "$menuFullFilePathOne" $pkgdir$linphone_desktop_install_prefix/share/applications
    cd $pkgdir$linphone_desktop_install_prefix/share/applications


    
    # Make minimized.desktop file
    #menuFileNameTwo=$executable_tag_lowercase-minimized.desktop
    echo "[Desktop Entry]" > $menuFullFilePathTwo
    echo "Encoding=UTF-8" >> $menuFullFilePathTwo
    echo "Name=$TITLE" >> $menuFullFilePathTwo
    echo "Name[fr]=$TITLE" >> $menuFullFilePathTwo
    echo "Name[sv]=$TITLE" >> $menuFullFilePathTwo
    echo "Name[cs]=$TITLE" >> $menuFullFilePathTwo
    echo "GenericName=SIP Phone" >> $menuFullFilePathTwo
    echo "Comment=A libre SIP client" >> $menuFullFilePathTwo
    echo "Comment[sv]=En fri SIP-telefon-klient" >> $menuFullFilePathTwo
    echo "Comment[fr]=Un libre SIP-client" >> $menuFullFilePathTwo
    echo "Comment[cs]=Libre SIP-klient" >> $menuFullFilePathTwo
    echo "Type=Application" >> $menuFullFilePathTwo
    echo "Icon=$linphone_desktop_icon_name" >> $menuFullFilePathTwo
    echo "Terminal=false" >> $menuFullFilePathTwo
    echo "Exec=$linphone_desktop_install_prefix/bin/linphone --iconified 'call sip-address=%u'" >> $menuFullFilePathTwo
    # Using a launcher to set library path
    #echo "Exec=$linphone_desktop_install_scripts_prefix/$executable_tag_lowercase --iconified 'call sip-address=%u'" >> $menuFullFilePathTwo
    echo "MimeType=x-scheme-handler/sip;x-scheme-handler/sip-linphone;x-scheme-handler/sip;x-scheme-handler/sips-linphone;x-scheme-handler/sips;x-scheme-handler/tel;x-scheme-handler/callto;x-scheme-handler/linphone-config;" >> $menuFullFilePathTwo
    echo "X-PulseAudio-Properties=media.role=phone" >> $menuFullFilePathTwo
    echo "StartupWMClass=linphone;linphone" >> $menuFullFilePathTwo
    echo "Categories=Application;Network;Telephony;Internet" >> $menuFullFilePathTwo
    #chmod +x $menuFullFilePathTwo


    
    # Make autostart script
    echo "#!/usr/bin/bash" > $scriptFullFilePathThree
    # Alpha or beta release
    # echo "# Create a script to auto-start $_app_name-beta" >> $scriptFullFilePathThree
    # Release
    echo "# Create a script to auto-start $_app_name" >> $scriptFullFilePathThree
    echo "# This shows the window at login" >> $scriptFullFilePathThree
    # Alpha or beta release
    # echo "# This starts $_app_name-beta minimized or --iconified" >> $scriptFullFilePathThree
    # Release
    echo "# This starts $_app_name minimized or --iconified" >> $scriptFullFilePathThree
    echo "# Remove all previous auto-start .desktop icons" >> $scriptFullFilePathThree
    echo "find \"\$HOME/.config/autostart\" -name *linphone*.desktop -type f -exec rm -f {} + 2>/dev/null" >> $scriptFullFilePathThree
    echo "# Copy custom linphone*.desktop file to user's \$HOME/.config/autostart folder" >> $scriptFullFilePathThree
    echo "mkdir -p \"\$HOME/.config/autostart\"" >> $scriptFullFilePathThree
    echo "cp \"$linphone_desktop_install_prefix/share/applications/$menuFileNameTwo\" \"\$HOME/.config/autostart\"" >> $scriptFullFilePathThree
    echo "chmod +x \"\$HOME/.config/autostart/$menuFileNameTwo\"" >> $scriptFullFilePathThree
    echo "echo \"Done. Linphone is in auto-start mode.\"" >> $scriptFullFilePathThree
    echo "Make script executable:  $scriptFullFilePathThree"
    chmod +x $scriptFullFilePathThree
    echo "--- Make remove autostart script ---"
    echo "#!/usr/bin/bash" > $scriptFullFilePathFour
    # Alpha or beta release
    # echo "# Create a script to remove auto-start $_app_name-beta" >> $scriptFullFilePathFour
    # Release
    echo "# Create a script to remove auto-start $_app_name" >> $scriptFullFilePathFour
    echo "rm -f \"\$HOME/.config/autostart/$menuFileNameTwo\"" >> $scriptFullFilePathFour
    echo "echo \"Done. Linphone is no longer in auto-start mode.\"" >> $scriptFullFilePathFour
    # Make script executable:
    chmod +x $scriptFullFilePathFour

    

    # Make script pre-uninstall-linphone
    echo "#!/usr/bin/bash" > $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "# Completely uninstall linphone $linphone_version" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "SCRIPT_DIR=\"\$( cd \"\$( dirname \"\${BASH_SOURCE[0]}\" )\" &> /dev/null && pwd )\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "cd \$SCRIPT_DIR" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "function shouldbedeleted() {" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "  string=\$(realpath \"\$1\")" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "  # Checking path: \$string" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "  if [[ \$string == *\"$linphone_version\"* ]]; then" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "    # 0 = true" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "    # \"Should be deleted.\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "    return 0 " >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "  else" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "    # 1 = false" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "    # \"Keep.\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "    return 1" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "  fi" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "}" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "# Check if root" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "if [ \"\$EUID\" -ne 0 ]" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "  then echo \"Please run as root or type: sudo pre-uninstall-linphone and press TAB key twice for auto-fill-in\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "  exit" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "fi" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "for fileorlink in linphone*" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "do" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "    if \$(shouldbedeleted \"\$fileorlink\"); then" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        # \$fileorlink will be deleted" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        # Delete command:" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        rm -f \"\$fileorlink\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "    fi" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "done" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "# To find all broken symbolic links under a given directory, run the following command to delete them:" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo \"Find broken symbolic links commands:\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo \"find . -xtype l -delete (run it twice)\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "find . -xtype l -delete 2>/dev/null" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "find . -xtype l -delete 2>/dev/null" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo \"find /usr/local/$_app_name -xtype l -delete (run it twice)\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "find /usr/local/$_app_name -xtype l -delete 2>/dev/null" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "find /usr/local/$_app_name -xtype l -delete 2>/dev/null" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo \"cd /usr/local/bin\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "    sleep 2" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "cd $linphone_desktop_install_scripts_prefix" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo \"find /usr/local/bin -xtype l -delete 2>/dev/null\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "find $linphone_desktop_install_scripts_prefix -xtype l -delete 2>/dev/null" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "for fileorlink in linphone*" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "do" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "    if \$(shouldbedeleted \"\$fileorlink\"); then" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        # \$fileorlink will be deleted" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        # Delete command:" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        rm -f \"\$fileorlink\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "    fi" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "done" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo \"Deleted directory $linphone_desktop_install_prefix\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo \"If directory above, linphone-destop is empty, then it can also be deleted.\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo \"Directory list command:\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo \"ls -al $linphone_desktop_parent_dir_prefix\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "ls -al \"$linphone_desktop_parent_dir_prefix\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo " " >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "if [ -z \"\$(ls -A $linphone_desktop_parent_dir_prefix)\" ]; then" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "   echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "   echo \"$linphone_desktop_parent_dir_prefix is empty\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "   echo \"The directory:\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "   echo \"$linphone_desktop_install_prefix\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "   echo \"should also be deleted.\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "   echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "   echo \"Delete command:\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "   echo \"rm -rf $linphone_desktop_install_prefix\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "   rm -rf \"$linphone_desktop_install_prefix\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "else" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "   echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "   echo \"$linphone_desktop_parent_dir_prefix is not empty\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "   echo \"Keeping the directory.\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "fi" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo \"Broken symbolic links:\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo \"find /usr/local/bin -xtype l -delete (run it twice)\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "find $linphone_desktop_install_scripts_prefix -xtype l -delete 2>/dev/null" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "find $linphone_desktop_install_scripts_prefix -xtype l -delete 2>/dev/null" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "# Users on the system" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "USERS=\$(awk -F':' '{ print \$1}' /etc/passwd)" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo \"These users seems to have access to linphone:\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo \$USERS" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "sleep 2" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo \"I will now remove the links to linphone for:\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo \$USERS" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "sleep 2" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "#for username in \$(awk -F':' '{ print \$1}' /etc/passwd); do" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "for user in \$USERS; do" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "    #echo User: \$user" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "    if [ -d \"/home/\$user/.local/share/icons/hicolor\" ]; then" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        echo \"User \$user\ has directory /home/\$user/.local/share/icons/hicolor\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        echo \"rm -f home/$user/.local/share/icons/hicolor/scalable/apps/linphone$linphone_desktop_tag.svg\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        rm -v -f \"/home/\$user/.local/share/icons/hicolor/scalable/apps/$linphone_desktop_icon_filename\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        echo \"Deleted /home/\$user/.local/share/icons/hicolor/scalable/apps/$linphone_desktop_icon_filename\"" >> $pkgdir%
    echo "        echo \"touch /home/\$user/.local/share/icons/hicolor\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        touch \"/home/\$user/.local/share/icons/hicolor\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        echo \"gtk-update-icon-cache /home/$user/.local/share/icons/hicolor > /dev/null\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        gtk-update-icon-cache \"/home/\$user/.local/share/icons/hicolor\" > /dev/null       " >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "    fi" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "    if [ -d \"/home/\$user/.local/share/applications\" ]; then" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        echo \"User \$user\ has directory /home/\$user/.local/share/applications\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        echo \"rm -f home/$user/.local/share/applications/linphone$linphone_desktop_tag.desktop\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        rm -v -f \"/home/\$user/.local/share/applications/linphone$linphone_desktop_tag.desktop\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        echo \"Deleted /home/\$user/.local/share/applications/linphone$linphone_desktop_tag.desktop\"" >> $pkgdir%
    echo "    fi" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "    if [ -d \"/home/\$user/.config/autostart\" ]; then" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        echo \"User \$user has directory /home/$user/.config/autostart\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        echo \"rm -f /home/\$user/.config/autostart/$executable_tag_lowercase-minimized.desktop\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        rm -f /home/\$user/.config/autostart/$executable_tag_lowercase-minimized.desktop" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "        echo \"Deleted /home/$user/.config/autostart/linphone$linphone_desktop_tag-minimized.desktop\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "    fi" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "done" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo \"[OK] Completely removed $_app_name $linphone_version\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    echo "exit 0" >> $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    # Make script executable
    chmod +x $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag
    # Copy uninstall-script:
    cp $pkgdir$linphone_desktop_install_scripts_prefix/pre-uninstall-linphone$linphone_desktop_tag $pkgdir$linphone_desktop_install_prefix/bin/uninstall-$_executable



    # Make script uninstall-linphone
    echo "#!/usr/bin/bash" > $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "# Completely uninstall linphone $linphone_version" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "SCRIPT_DIR=\"\$( cd \"\$( dirname \"\${BASH_SOURCE[0]}\" )\" &> /dev/null && pwd )\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "cd \$SCRIPT_DIR" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "function shouldbedeleted() {" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "  string=\$(realpath \"\$1\")" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "  # Checking path: \$string" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "  if [[ \$string == *\"$linphone_version\"* ]]; then" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    # 0 = true" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    # \"Should be deleted.\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    return 0 " >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "  else" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    # 1 = false" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    # \"Keep.\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    return 1" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "  fi" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "}" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "# Check if root" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "if [ \"\$EUID\" -ne 0 ]" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "  then echo \"Please run as root or type: sudo uninstall-linphone and press TAB key twice for auto-fill-in\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "  exit" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "fi" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "CHECK_IF_ZST_IS_INSTALLED=\`pacman -Qs ${zst_name}\`" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "if [ -n $CHECK_IF_ZST_IS_INSTALLED ]; then" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    echo \"$_app_name was installed as ZST package $linphone_desktop_pacman_zst_identifier\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    sleep 2" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    echo \"I will try to uninstall the ZST package $linphone_desktop_pacman_zst_identifier.\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    sleep 2" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    echo \"Then I will check that everything was deleted.\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    sleep 2" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    echo \"Uninstall command:\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    echo \"   pacman --noconfirm -Rns $linphone_desktop_pacman_zst_identifier\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    sleep 2" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    pacman --noconfirm -Rns $linphone_desktop_pacman_zst_identifier" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "else" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    echo \"It looks like variable \$CHECK_IF_ZST_IS_INSTALLED is empty.\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    sleep 2" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    echo \"That means that the zst package $zst_name is not longer installed.\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    sleep 2" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    echo CHECK_IF_ZST_IS_INSTALLED=\$CHECK_IF_ZST_IS_INSTALLED" >> $pkgdir%
    echo "    sleep 2" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "fi" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "Deleting files if they still exist:" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    echo \"rm -f linphone$linphone_desktop_tag\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "rm -f linphone$linphone_desktop_tag" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    echo \"rm -f change-linphone$linphone_desktop_tag-icon\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "rm -f change-linphone$linphone_desktop_tag-icon" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    echo \"rm -f uninstall-linphone$linphone_desktop_tag\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "rm -f uninstall-linphone$linphone_desktop_tag" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "for fileorlink in linphone*" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "do" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    if \$(shouldbedeleted \"\$fileorlink\"); then" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        # \$fileorlink will be deleted" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        # Delete command:" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        rm -f \"\$fileorlink\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    fi" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "done" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "# To find all broken symbolic links under a given directory, run the following command to delete them:" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo \"Find broken symbolic links commands:\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo \"find . -xtype l -delete (run it twice)\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "find . -xtype l -delete 2>/dev/null" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "find . -xtype l -delete 2>/dev/null" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo \"find /usr/local/$_app_name -xtype l -delete (run it twice)\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "find /usr/local/$_app_name -xtype l -delete 2>/dev/null" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "find /usr/local/$_app_name -xtype l -delete 2>/dev/null" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo \"cd /usr/local/bin\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    sleep 2" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "cd $linphone_desktop_install_scripts_prefix" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo \"find /usr/local/bin -xtype l -delete 2>/dev/null\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "find $linphone_desktop_install_scripts_prefix -xtype l -delete 2>/dev/null" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "for fileorlink in linphone*" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "do" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    if \$(shouldbedeleted \"\$fileorlink\"); then" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        # \$fileorlink will be deleted" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        # Delete command:" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        rm -f \"\$fileorlink\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    fi" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "done" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo \"Deleted directory $linphone_desktop_install_prefix\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo \"If directory above, linphone-destop is empty, then it can also be deleted.\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo \"Directory list command:\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo \"ls -al $linphone_desktop_parent_dir_prefix\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "ls -al \"$linphone_desktop_parent_dir_prefix\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo " " >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "if [ -z \"\$(ls -A $linphone_desktop_parent_dir_prefix)\" ]; then" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "   echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "   echo \"$linphone_desktop_parent_dir_prefix is empty\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "   echo \"The directory:\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "   echo \"$linphone_desktop_install_prefix\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "   echo \"should also be deleted.\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "   echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "   echo \"Delete command:\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "   echo \"rm -rf $linphone_desktop_install_prefix\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "   rm -rf \"$linphone_desktop_install_prefix\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "else" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "   echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "   echo \"$linphone_desktop_parent_dir_prefix is not empty\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "   echo \"Keeping the directory.\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "fi" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo \"Broken symbolic links:\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo \"find /usr/local/bin -xtype l -delete (run it twice)\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "find $linphone_desktop_install_scripts_prefix -xtype l -delete 2>/dev/null" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "find $linphone_desktop_install_scripts_prefix -xtype l -delete 2>/dev/null" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "# Users on the system" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "USERS=\$(awk -F':' '{ print \$1}' /etc/passwd)" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo \"These users seems to have access to linphone:\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo \$USERS" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "sleep 2" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo \"I will now remove the links to linphone for:\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo \$USERS" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "sleep 2" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "#for username in \$(awk -F':' '{ print \$1}' /etc/passwd); do" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "for user in \$USERS; do" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    #echo User: \$user" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    if [ -d \"/home/\$user/.local/share/icons/hicolor\" ]; then" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        echo \"User \$user\ has directory /home/\$user/.local/share/icons/hicolor\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        echo \"rm -f home/$user/.local/share/icons/hicolor/scalable/apps/linphone$linphone_desktop_tag.svg\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        rm -v -f \"/home/\$user/.local/share/icons/hicolor/scalable/apps/$linphone_desktop_icon_filename\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        echo \"Deleted /home/\$user/.local/share/icons/hicolor/scalable/apps/$linphone_desktop_icon_filename\"" >> $pkgdir%
    echo "        echo \"touch /home/\$user/.local/share/icons/hicolor\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        touch \"/home/\$user/.local/share/icons/hicolor\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        echo \"gtk-update-icon-cache /home/$user/.local/share/icons/hicolor > /dev/null\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        gtk-update-icon-cache \"/home/\$user/.local/share/icons/hicolor\" > /dev/null       " >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    fi" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    if [ -d \"/home/\$user/.local/share/applications\" ]; then" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        echo \"User \$user\ has directory /home/\$user/.local/share/applications\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        echo \"rm -f home/$user/.local/share/applications/linphone$linphone_desktop_tag.desktop\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        rm -v -f \"/home/\$user/.local/share/applications/linphone$linphone_desktop_tag.desktop\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        echo \"Deleted /home/\$user/.local/share/applications/linphone$linphone_desktop_tag.desktop\"" >> $pkgdir%
    echo "    fi" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    if [ -d \"/home/\$user/.config/autostart\" ]; then" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        echo \"User \$user has directory /home/$user/.config/autostart\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        echo \"rm -f /home/\$user/.config/autostart/$executable_tag_lowercase-minimized.desktop\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        rm -f /home/\$user/.config/autostart/$executable_tag_lowercase-minimized.desktop" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "        echo \"Deleted /home/$user/.config/autostart/linphone$linphone_desktop_tag-minimized.desktop\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "    fi" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "done" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo \"[OK] Completely removed $_app_name $linphone_version\"" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "echo" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    echo "exit 0" >> $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    # Make script executable
    chmod +x $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag
    # Copy uninstall-script:
    cp $pkgdir$linphone_desktop_install_scripts_prefix/uninstall-linphone$linphone_desktop_tag $pkgdir$linphone_desktop_install_prefix/bin/uninstall-$_executable

    echo "--- Creating change-icon script: ---"
    echo "Create script to change-linphone-icon on user basis"
    echo "#!/usr/bin/bash" > $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "# Change linphone icon" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "SCRIPT_DIR=\"\$( cd \"\$( dirname \"\${BASH_SOURCE[0]}\" )\" &> /dev/null && pwd )\"" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "cd \$SCRIPT_DIR" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "echo" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "LINPHONE_ICON_NAME=\"$linphone_desktop_icon_name\"" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "IMG=abc.svg" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    # If script is in /usr/local/bin :
    # echo "cd ../$_app_name/$linphone_version/share/icons/hicolor/scalable/apps" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    # If script is in /usr/local/$_app_name/$linphone_version/bin :
    echo "cd /usr/local/$_app_name/$linphone_version/share/icons/hicolor/scalable/apps" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "echo \"Which icon do you prefer for $_app_name $linphone_version?\"" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "sleep 3" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "echo \"Select a number in the list that shows up.\"" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "sleep 3" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "echo \"Hit Ctrl + C to cancel\"" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "sleep 3" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "# Show the icon selection:" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "xdg-open ./" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "FILE=a" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "select file in \$(ls *.svg); do " >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "   echo \$REPLY \$file" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "   FILE=\$file" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "   break" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "done" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "mkdir -p \"/home/\$USER/.local/share/icons/hicolor/scalable/apps\"" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "if [ ! -f \"/home/\$USER/.local/share/icons/hicolor/index.theme\" ]; then" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "    cp \"$linphone_desktop_install_share_prefix/icons/hicolor/index.theme\" \"/home/\$USER/.local/share/icons/hicolor/index.theme\"    " >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "fi" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "# We only want to change the icon on this version." >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "# To change icon for all regular linphone versions, uncomment the line." >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "#cp \"\$FILE\" \"/home/\$USER/.local/share/icons/hicolor/scalable/apps/linphone.svg\"" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "cp \"\$FILE\" \"/home/\$USER/.local/share/icons/hicolor/scalable/apps/$linphone_desktop_icon_filename\"" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "echo \"You can change the icon manually by exchanging the file:\"" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "echo \"/home/\$USER/.local/share/icons/hicolor/scalable/apps/$linphone_desktop_icon_filename\"" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "sleep 5" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "echo \"The folder will be opened for you now.\"" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "sleep 3" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "xdg-open \"/home/\$USER/.local/share/icons/hicolor/scalable/apps/\" &" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon

    echo "--- We also need to create a local .desktop file to show the icon ---"
    echo "cp /usr/local/$_app_name/$linphone_version/share/applications/$executable_tag_lowercase.desktop \$HOME/.local/share/applications" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "chmod +x \$HOME/.local/share/applications" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "sed -i \"s|Icon.*|Icon=\${HOME}\/\.local\/share\/icons\/hicolor\/scalable\/apps\/$executable_condensed_tag\.svg|g\" \$HOME/.local/share/applications/$executable_tag_lowercase.desktop" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "touch \$HOME/.local/share/icons/hicolor" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "gtk-update-icon-cache \$HOME/.local/share/icons/hicolor" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon

    echo "touch \"/home/\$USER/.local/share/icons/hicolor\"" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "gtk-update-icon-cache \"/home/\$USER/.local/share/icons/hicolor\"" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    echo "exit 0" >> $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon

    # Make script executable
    chmod +x $pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon

    # Make manpage
    echo "--- Create markup manpage for: $_executable$linphone_desktop_tag ---"
    echo "% $executable_tag_uppercase(1) $executable_tag_lowercase $linphone_desktop_version | kimi documentation" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "% $_packagerHumanFormat" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "% $manpage_date" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "# NAME" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "$executable_tag_lowercase - SIP softphone (telephone) graphical client with GUI and command line interface (CLI)" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "# SYNOPSIS" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**$executable_tag_lowercase** [*OPTION*]" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**$executable_tag_lowercase** *COMMAND*" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "# DESCRIPTION" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "Linphone is an audio and video internet phone using the SIP protocol. It goes by the names:" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - **$_app_name** (for laptops, computers, netbooks)" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - **linphone** (for mobile platforms on phones and tablets)" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "A SIP client offers the possibility to have a "SIP-telephone-number" similar to an e-mail address, without paying attention to which SIP-softphone the other person has chosen. As long as both softwares use a similar way of conveying audio and video, it will work. In a way, it is similar to how traditional telephony work. Modern communication systems often require the use of a special software to be able to phone each other, meanwhile SIP-clients don't require anything else than a soft-phone that complies with the SIP protocol to be able to be understood by all the other SIP-soft-phones out there." >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    if $ISRELEASE; then
        echo "**$executable_tag_lowercase** is a release version of Linphone." >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    else
        echo "**$executable_tag_lowercase** is a $linphone_desktop_alphabeta version of Linphone. A $linphone_desktop_alphabeta version is often quite stable. A $linphone_desktop_alphabeta version version usually still contains bugs, but usually there is a workaround. A workaround is a bypass of a recognized problem or limitation in a system or policy. A workaround is a temporary fix that implies that a genuine solution to the problem is needed. But workarounds are frequently as creative as true solutions, involving outside the box thinking in their creation." >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    fi
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**$executable_tag_lowercase** is IP softphone (telephone) graphical client with GUI and command line interface (CLI) using the Session Initiation Protocol (SIP) protocol. SIP is a signaling protocol used for initiating, maintaining, and terminating real-time sessions that include voice, video and messaging applications. SIP is used for signaling and controlling multimedia communication sessions in applications of Internet telephony for voice and video calls, in private IP telephone systems, in instant messaging over Internet Protocol (IP) networks as well as mobile phone calling over LTE (VoLTE). Running **$executable_tag_lowercase** without any command line parameters causes **$executable_tag_lowercase** to launch the app(lication) graphical user interface (GUI). GUI is a form of user interface that allows users to interact with electronic devices through graphical icons and audio indicator such as primary notation, instead of text-based user interfaces in a terminal (tilix, gnome-termina, xterm etc.), typed command labels or text navigation. GUIs were introduced in reaction to the perceived steep learning curve of command-line interfaces (CLIs), which require commands to be typed on a computer keyboard into a terminal window. A terminal window is the "heart" of a computer system." >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "The main features of **$executable_tag_lowercase** are:" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - a nice graphical interface;" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - it includes a large variety of codecs with different quality / bandwidths;" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - it uses the well-known and standardised SIP protocol." >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**Signaling features :**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - Digest and TLS client certificate authentication" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - Multiple call management: hold, resume, transfer and more" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - Multiple SIP proxy support: registrar, proxies, outbound proxies" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - Presence using list subscription to presence server" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - DTMF (telephone tones)" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - Interoperability with IMS networks" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - Suitable for building a VoLTE-compatible client" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**Media features :**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - HD audio calls with support for Opus codec" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - HD video calls with support for H.264, H.265 and VP8 codecs" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - State-of-the-art adaptive jitter buffer algorithm" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - Innovative adaptive bitrate control" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - ICE support for optimised NAT traversal" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - SRTP and ZRTP media encryption" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - Audio and video call recording" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**Instant Messaging features :**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - One-to-one and group instant messages" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - Delivery and "is typing" notifications" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - End-to-end encryption for one-to-one and group conversations" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "   - File sharing, with configurable settings to automatically / manually download attachments" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**$executable_tag_lowercase** uses Qt/QML for the graphical part and bundles the liblinphone SDK version $linphone_sdk_version needed to operate." >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "# OPTIONS" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "The most important commands are:" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**call \<sip url\>**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo ": to call someone. A sip url is in the form sip:user@host" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**terminate**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo ": to terminate a call" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**answer**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo ": to accept an incoming call." >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**help**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo ": to display interactive help." >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "# EXAMPLES" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**$executable_tag_lowercase help**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**$executable_tag_lowercase --cli-help**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**$executable_tag_lowercase "call sip-address=user@sip.server.org"**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**$executable_tag_lowercase call sip-address=user@sip.server.org**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**$executable_tag_lowercase CALL 'sip-address=user@sip.server.org'**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**$executable_tag_lowercase "call sip-address=user@sip.server.org?method=call"**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**$executable_tag_lowercase answer**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**$executable_tag_lowercase terminate**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "URI format:" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo ": **<scheme\>:<address\>?method=<method\>([&<argument\>=<base64-value\>]*)**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "If you want to launch a call to **sip:user@sip.linphone.org**, you can use URI:" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo ": **sip:user@sip.linphone.org?method=call**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "The command line equivalent is:" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo ": **$executable_tag_lowercase "call sip-address=sip:user@sip.linphone.org"**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "The full command list can be obtained with:" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo ": **$executable_tag_lowercase --cli-help**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "# EXIT VALUES" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**0**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo ": Success (unverified)" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "**1**" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo ": Error? (unverified)" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "# BUGS" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "* Not possible to initiate a call from command line in earlier version. Maybe solved." >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "# COPYRIGHT" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "" >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "Belledonne Communications SARL state GPLv3. Unclear if it means GPL-3.0-only or GPL-3.0-or-later." >> $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "--- End create markup manpage for: $_executable$linphone_desktop_tag ---"

    echo "--- Convert markup to groff ---"
    pandoc $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md -s -t man -o $pkgdir$linphone_desktop_install_man_prefix/$executable_tag_lowercase.1
    rm -f $pkgdir$linphone_desktop_install_man_prefix/$_executable$linphone_desktop_tag.1.md
    echo "--- End convert markup to groff ---"

    echo "--- Install shared mime info ---"
    cp -v ${BUILDDIR}/${_packager_lowercase}-${_app_name}.xml_template ${BUILDDIR}/${pkgname}.xml
    cp -v ${BUILDDIR}/${pkgname}.xml  $pkgdir/usr/share/mime/packages

    # Copy manpage to ../usr/local/$_app_name/$linphone_version/man/man1

    mkdir -p -v $pkgdir/usr/local/$_app_name/$linphone_version/man/man1
    cp $manpageFullFilePath ${pkgdir}/usr/local/$_app_name/$linphone_version/man/man1

    function createLink(){
        # Uses the variables $LINK and $TARGET
        LINKDIR=$(dirname "$LINK")
        if $VERBOSE; then
            ln -vf -s $(realpath --relative-to="$LINKDIR" "$TARGET") "$LINK"
        else
            ln -f -s $(realpath --relative-to="$LINKDIR" "$TARGET") "$LINK"
        fi
    }

    # Make link to executable if not using a launcher
    LINK=$pkgdir$linphone_desktop_install_scripts_prefix/$_executable$linphone_desktop_tag
    TARGET=$pkgdir$linphone_desktop_install_prefix/bin/$_executable
    createLink

    # Make link to auto-start
    LINK=$pkgdir/usr/local/bin/auto-start-$executable_tag_lowercase
    TARGET=$pkgdir/usr/local/$_app_name/$linphone_version/bin/auto-start-linphone
    createLink

    # Make link to remove-auto-start
    LINK=$pkgdir/usr/local/bin/auto-start-$executable_tag_lowercase-remove
    TARGET=$pkgdir/usr/local/$_app_name/$linphone_version/bin/auto-start-linphone-remove
    createLink
    # Make link to change-icon
    LINK=$pkgdir/usr/local/bin/change-$executable_tag_lowercase-icon
    TARGET=$pkgdir/usr/local/$_app_name/$linphone_version/bin/change-linphone-icon
    createLink

    # Make link to uninstall
    LINK=$scriptLinkFileNameTwenty
    TARGET=$scriptFullFilePathTwenty
    createLink

    echo "--- Listing contents of $pkgdir : ---"
    find $pkgdir 2>/dev/null
    echo "--- End listing contents of $pkgdir ---"

    # Remove certificate. No need to package certificate.
    # rm -f $pkgdir$linphone_desktop_install_prefix/share/linphone/rootca.pem

    export NO_BRP_CHECK_RPATH=true

    echo "=================================="
    echo "--- Listing contents of $pkgdir ---"
    find $pkgdir 2>/dev/null
    echo "--- End listing contents of $pkgdir ---"

    echo "=================================="
    echo "--- Listing symlinks of $pkgdir ---"
    find -L $pkgdir -type l 2>/dev/null
    echo "--- End listing symlinks of $pkgdir ---"

    echo "=================================="
    echo "--- Listing files of $pkgdir ---"
    find $pkgdir -type f 2>/dev/null
    echo "--- End listing files of $pkgdir ---"

    echo "=================================="
    echo "--- Listing directories of $pkgdir ---"
    find $pkgdir -type d 2>/dev/null
    echo "--- End listing directories of $pkgdir ---"

    echo "------------------------------"
    PACKAGEARCH=$(uname -m)
    PACKAGETARFILENAME="${zst_name}-${pkgver}-${pkgrel}-${PACKAGEARCH}.pkg.tar"
    PACKAGEZSTFILENAME="${zst_name}-${pkgver}-${pkgrel}-${PACKAGEARCH}.pkg.tar.zst"
    PACKAGETARFULLPATH="${BUILDDIR}/${PACKAGETARFILENAME}"
    PACKAGEZSTFULLPATH="${BUILDDIR}/${PACKAGEZSTFILENAME}"
    
    # Create install script
    INSTALLSCRIPTPATH=${BUILDDIR}/install-${zst_name}-${pkgver}-${pkgrel}-${PACKAGEARCH}
    echo "#!/bin/bash" > $INSTALLSCRIPTPATH
    echo "if [ -f \"$PACKAGEZSTFULLPATH\" ]; then" >> $INSTALLSCRIPTPATH
    echo "    sudo pamac install \"$PACKAGEZSTFULLPATH\"" >> $INSTALLSCRIPTPATH
    echo "elif [ -f \"$PACKAGETARFULLPATH\" ]; then" >> $INSTALLSCRIPTPATH
    echo "    zstd \"$PACKAGETARFULLPATH\"" >> $INSTALLSCRIPTPATH
    echo "    sudo pamac install \"$PACKAGETARFULLPATH\"" >> $INSTALLSCRIPTPATH
    echo "else" >> $INSTALLSCRIPTPATH
    echo "    echo \"Install ZST:\"" >> $INSTALLSCRIPTPATH
    echo "    echo \"Dont forget to check if $pkgname was installed.\"" >> $INSTALLSCRIPTPATH
    echo "    echo \"It should be located in:\"" >> $INSTALLSCRIPTPATH
    echo "    echo \"    ${BUILDDIR}\"" >> $INSTALLSCRIPTPATH
    echo "    echo" >> $INSTALLSCRIPTPATH
    echo "    echo \"Install with:\"" >> $INSTALLSCRIPTPATH
    echo "    echo \"    sudo pacman -U \\\"$PACKAGEZSTFULLPATH\\\"\"" >> $INSTALLSCRIPTPATH
    echo "    echo \"or:\"" >> $INSTALLSCRIPTPATH
    echo "    echo \"    sudo pacman -U \\\"$PACKAGETARFULLPATH\\\"\"" >> $INSTALLSCRIPTPATH
    echo "    if hash zenity 2>/dev/null; then" >> $INSTALLSCRIPTPATH
    echo "        zenity --height 400 --width 400 --warning --title \"Install ZST\" --text \"Dont forget to check if $pkgname was installed.\n\nPackage should be located in:\n\n${srcdir}\n\nInstall with terminal command:\n\nsudo pacman -U \\\"$PACKAGEZSTFULLPATH\\\"\n\nor\n\nsudo pacman -U \\\"$PACKAGETARFULLPATH\\\" &\"" >> $INSTALLSCRIPTPATH
    echo "    fi" >> $INSTALLSCRIPTPATH
    echo "fi" >> $INSTALLSCRIPTPATH
    chmod +x $INSTALLSCRIPTPATH
    #if hash zenity 2>/dev/null; then
    #    zenity --height 400 --width 400 --warning --title "Install ZST" --text "Dont forget to check if $pkgname was installed.\n\nPackage should be located in:\n\n${BUILDDIR}\n\nInstall with terminal command:\n\n$INSTALLSCRIPTPATH\n\n" &
    #fi

    if [ -f \"$PACKAGEZSTFULLPATH\" ]; then
        sudo pamac install \"$PACKAGEZSTFULLPATH\"
    elif [ -f \"$PACKAGETARFULLPATH\" ]; then
        zstd \"$PACKAGETARFULLPATH\"
        sudo pamac install \"$PACKAGETARFULLPATH\"
    fi
    
    echo "There should now exist installable ZST (or TAR) packages in:"
    echo \${BUILDDIR}=${BUILDDIR}

    echo "--- Exiting section package() ---"
}
