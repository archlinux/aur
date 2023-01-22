# Maintainer: Igor Kushnir < igorkuo AT gmail dot com >
# Contributor:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: aksr <aksr at t-com dot me>
# Contributor: VirtualTam <virtualtam@flibidi.net>
# Contributor: Eugene Yudin aka Infy <Eugene dot Yudin at gmail dot com>

pkgname='goldendict-webengine-pr-git'
_basename='goldendict'
pkgver=22.12.02.r10.gdf7ccad3
pkgrel=1
pkgdesc='Feature-rich dictionary lookup program supporting multiple dictionary formats'
arch=('i686' 'x86_64')
_upstream_url="https://github.com/${_basename}/${_basename}"
_fork_url="https://github.com/vedgy/${_basename}"
url="${_upstream_url}/pull/1542"
license=('GPL3')
depends=(
    'bzip2'
    'ffmpeg'
    'gcc-libs'
    'glibc'
    'hunspell'
    'libao'
    'libeb'
    'libtiff'
    'libvorbis'
    'libx11'
    'libxtst'
    'lzo'
    'opencc'
    'qt5-base'
    'qt5-multimedia'
    'qt5-svg'
    'qt5-tools'
    'qt5-webengine'
    'qt5-x11extras'
    'xz'
    'zlib'
    'zstd'
)
makedepends=('git')
provides=("${_basename}=${pkgver}")
conflicts=("${_basename}")
# Note: the we/webkit-or-webengine branch contains the same code as the pull request's branch
# webkit-or-webengine, but is stable. That is, upstream master is merged in not rebased onto.
source=("${pkgname}::git+${_fork_url}.git#branch=we/webkit-or-webengine")
b2sums=('SKIP')

pkgver() {
    cd "${pkgname}"

    # Generate git tag based version. Count only expected we##.##.##* [#=digit] tags.
    local _gitversion=$(git describe --long --tags --match 'we[0-9][0-9].[0-9][0-9].[0-9][0-9]*' \
        | sed -e 's|^we||' | tr '[:upper:]' '[:lower:]')

    # Format git-based version for pkgver
    # Expected format: e.g. 22.12.02.r0.ga64d1bb4
    echo "${_gitversion}" | sed \
        -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
        -e 's|\([0-9]\+-g\)|r\1|' \
        -e 's|-|.|g'
}

_git_pull() {
    # Ensure that merging does not require user interaction and succeeds even if git
    # user.name, user.email and pull.rebase are not configured in the user's system.
    git -c "user.name=GD WE PR merger" -c "user.email=gd-we-pr-merger@example.com" pull --no-rebase --no-edit "$@"
}

# Branches of some pull requests conflict with the we/webkit-or-webengine branch.
# The conflicts are resolved in merge commits to branches with the "we/" prefix
# in their names. This _pull_we function checks if the corresponding
# "we/"-prefixed branch exists and prefers that to the main pull request branch.
# Takes a single argument: a branch name in "${_fork_url}".
_pull_we() {
    branch_name="$1"
    we_branch_name="we/${branch_name}"
    git ls-remote --exit-code --heads origin "${we_branch_name}" && true
    if [ $? -eq 0 ]; then
        branch_name="${we_branch_name}"
    fi
    _git_pull origin "${branch_name}"
}

prepare() {
    cd "${pkgname}"

    # If merging upstream master fails, please do the following:
    # 1) comment this line out to finish the build;
    # 2) flag the package out-of-date.
    _git_pull "${_upstream_url}" master

    # If you wish to include a fix or a feature from one of vedgy's pull requests
    # (https://github.com/goldendict/goldendict/pulls?q=is%3Apr+is%3Aopen+sort%3Aupdated-desc+author%3Avedgy),
    # uncomment and possibly modify one or more of the following lines:
    # _pull_we add-toggle-scan-popup-cmd-line-option
    # _pull_we wip-pronounce-stop-if-playing-and-from-next-dictionary
    # _pull_we all-my-fixes

    echo "Fixing QMake in goldendict.pro file..."
    echo "QMAKE_CXXFLAGS_RELEASE = ${CFLAGS}" >> goldendict.pro
    echo "QMAKE_CFLAGS_RELEASE = ${CXXFLAGS}" >> goldendict.pro
}

build(){
    cd "${pkgname}"
    qmake-qt5 \
        'CONFIG+=use_qtwebengine' \
        'CONFIG+=chinese_conversion_support' \
        'CONFIG+=zim_support' \
        PREFIX='/usr' \
        goldendict.pro
    make
}

package() {
    cd "${pkgname}"
    make INSTALL_ROOT="${pkgdir}" install
}
