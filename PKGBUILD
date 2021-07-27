pkgname='kopano-libvmime-git'
pkgver=0.9.2k4
pkgrel=1
provides=(
    'libvmime=${pkgver}'
	 )
pkgdesc='A C++ class library for working with MIME messages'
arch=(
    'armv7l'
    'aarch64'
    'i686'
    'x86_64'
     )
url='http://www.vmime.org/'
license=(
    'GPL'
	)
	
_tagPrefix="v"
# template start; name=base-scm; version=1;
#_tagPrefix=""
#_tagSuffix=""
#_remoteGit=""

if [[ "${pkgname}" == *-latest ]] && [ ! -z "${_remoteGit}" ];
then
    pkgver=$(git ls-remote --refs --tags "${_remoteGit}" | sed 's|.*tags/\(.*\)$|\1|' | sort -u | grep -vE "(beta|alpha|test)" | tail -n 1)
fi

_basePkgName="${pkgname//-git/}"
if [[ "${pkgname}" == *-git ]];
then
    # Version can't be set before pkgver has run
    provides+=("${_basePkgName}=${pkgver}")
fi

_gitLogByDay() {
    local NEXT=$(date +%F)
    local SINCE="1970-01-01"
    local UNTIL=$NEXT
    local LOG_FORMAT="* %s"
    git log --no-merges --since="${SINCE}" --until="${UNTIL}" --format="%cd" --date=short --follow . | sort -u | while read DATE ; do
	local GIT_PAGER=$(git log --no-merges --reverse --format="${LOG_FORMAT}" --since="${DATE} 00:00:00" --until="${DATE} 23:59:59" --author="${AUTHOR}" --follow . | uniq)
	if [ ! -z "$GIT_PAGER" ]
	then
	    echo
	    echo -e "[$DATE]"
	    echo -e "${GIT_PAGER}"
	fi
    done
}
if [ ! -e "changelog" ] \
    || git rev-parse ;
then
    _gitLogByDay > changelog
    changelog="changelog"
fi

# https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
pkgver() {
    cd ${srcdir}/${pkgname}
    if [[ "${pkgname}" == *-git ]];
    then
	_lastTag=$(git tag -l "${_tagPrefix}*" --sort=v:refname | tail -n 1)
	_revision="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	if [ ! -z "${_lastTag}" ];
	then
	    echo "${_lastTag}" | sed "s|${_tagPrefix}\(.*\)${_tagSuffix}|\1.r${_revision}|"
	else
	    echo "${pkgver}" | sed "s|\(.*\)-git|1.r${_revision}|"
	fi
#    elif [[ "${pkgname}" == *-latest ]];
#    then
#	#_tagReleaseFormat="^[0-9]*(\.[0-9])*$"
#	_lastRelease=$(git tag -l "${_tagPrefix}*" --sort=v:refname | grep -v "(alpha|beta|test)"  | tail -n 1)
#	echo "${_lastRelease}" | sed "s|${_tagPrefix}\(.*\)${_tagSuffix}|\1|"
    else
        echo "${pkgver}"
    fi
}

_patchFromGit() {
    _patchDir="${srcdir}/$(basename $(pwd))-patch.git"
    if [ ! -e "${_patchDir}" ];
    then
	git clone --bare ${1} ${_patchDir}
    fi

    _branchName="${_sourceBranch//#*=/}"
    _patchGIT="git --git-dir="${_patchDir}""

    # Patch From Specific Range
    if [ ! -z "${3}" ];
    then

	_sourceCommit=$($_patchGIT rev-parse --verify --quiet "${2}")
	_targetCommit=$($_patchGIT rev-parse --verify --quiet "${3}")
	if $_patchGIT format-patch "^${_sourceCommit}" "${_targetCommit}" --stdout | git apply -v ;
	then
	    echo "Patch Applied From Commit Between ${2} to ${3}"
	else
	    echo "Patch Failed."
	    exit 1
        fi

    # Patch From Specific Commit
    elif [ ! -z "${2}" ];
    then

	_sourceCommit=$($_patchGIT rev-parse --verify --quiet "${2}")
	if $_patchGIT format-patch -1 "${_sourceCommit}" --stdout | git apply -v ;
	then
	    echo "Patch Applied From Commit ${2}"
	else
	    echo "Patch Failed."
	    exit 1
	fi

    # Patch From "*-latest-patch" Branch
    elif [[ "${pkgname}" != *-git ]] \
	 && _sourceCommit=$($_patchGIT rev-parse --verify --quiet "${_branchName}") \
	 && _targetCommit=$($_patchGIT rev-parse --verify --quiet "${_branchName}-latest-patch") ;
    then

	if $_patchGIT format-patch "^${_sourceCommit}" "${_targetCommit}" --stdout | git apply -v ;
	then
	    echo "Patch Applied From Branch ${_branchName}-latest-patch"
	else
	    echo "Patch Failed."
	    exit 1
	fi

    # Patch From "master-latest-patch" Branch
    elif _sourceCommit=$($_patchGIT rev-parse --verify --quiet "master") \
         && _targetCommit=$($_patchGIT rev-parse --verify --quiet "master-latest-patch") ;
    then

	if $_patchGIT format-patch "^${_sourceCommit}" "${_targetCommit}" --stdout | git apply -v ;
	then
	    echo "Patch Applied From Branch master-latest-patch"
	else
	    echo "Patch Failed."
	    exit 1
	fi

    else
	echo "No Patch Branch Found"

    fi
}

_sourceBranch=$(if [[ "${pkgname}" == *-git ]]; then echo "#branch=master"; else echo "#tag=${_tagPrefix}${pkgver}${_tagSuffix}"; fi)
# template end;

conflicts=(
    'zarafa-libvmime'
	  )
source=(
    "${pkgname}::git+https://github.com/Kopano-dev/vmime.git${_sourceBranch}"
	)
md5sums=(
    'SKIP'
	)

makedepends=(
    'cmake'
    'postfix'
    'doxygen'
    'xdot'
    
    # PKGBUILD dependencies
    'git'
	    )
depends=(
    'gsasl' 
    'gnutls'
	)

prepare() {
    cd ${srcdir}/${pkgname}
    _patchFromGit https://github.com/pietmacom/kopano-vmime.git
}

build() {
    mkdir build
    cd build

    cmake ../${pkgname} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=/usr/lib/ \
    -DCMAKE_BUILD_TYPE=Release

    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}