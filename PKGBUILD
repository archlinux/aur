pkgname='kopano-webapp-webmeetings-git'
pkgver='3.0.6'

_source='git+https://stash.kopano.io/scm/kwa/web-meetings.git'
_tagPrefix='v'

# template start; name=kopano-webapp-plugin; version=1;
# _source=
# _tagPrefix=kopanocore-

pkgrel=1
groups=(
    'kopano'
    'kopano-webapp-plugins'
	)
arch=(
    'any'
     )

manifestXml() {
    _manifestXmlFile="src/${pkgname}/manifest.xml"
    if [ -e "${_manifestXmlFile}" ];
    then
        xmllint --xpath "string(/plugin/info/$1)" ${_manifestXmlFile}
    else
	echo
    fi
}
pkgdesc="$(manifestXml 'description')"
url="$(manifestXml 'authorURL')"

for _licenseFile in AGPL-3
do
    if [ -e "src/${pkgname}/${_licenseFile}" ];
    then
	license+=('AGPL-3')
    fi
done

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

source+=(
    "${pkgname}::${_source}${_sourceBranch}"
	)
md5sums+=(
    'SKIP'
	)

_phpIni="${_basePkgName}.ini"
if [ -e "${_phpIni}" ];
then
    source+=(
	"${_phpIni}"
	    )
    md5sums+=(
	"$(md5sum ${_phpIni})"
	     )
fi

makedepends+=(
    # WEBAPP: https://stash.kopano.io/projects/KW/repos/kopano-webapp/browse/README.md
    'apache-ant'
    'libxml2'

    # PKGBUILD
    'git'
    'gzip'
             )
depends+=(
    'kopano-webapp'
	 )

if [ -f 'install' ];
then
    install='install'
fi


# template start; name=base-build-webapp; version=1;
# https://wiki.archlinux.org/index.php/Web_application_package_guidelines
_binDir=usr/share/webapps/${_basePkgName}
_confDir=etc/webapps/${_basePkgName}
# template start; name=base-build; version=1;
# https://wiki.archlinux.org/index.php/Arch_package_guidelines
#_binDir=
#_confDir=

if [ -z "${_basePkgName}" ];
then
    _basePkgName="${pkgname}"
fi
_docDir=usr/share/doc/${_basePkgName}
_stateDir=var/lib/${_basePkgName}
_logDir=var/log/${_basePkgName}
_licenseDir=usr/share/licenses/${_basePkgName}

_commonPermissions='u=rwx,g=rx,o=rx u=rw,g=r,o=r'
_securePermissions='u=rwx,g=rx,o= u=rw,g=r,o='


# Strictly Formatted Installation
#
# Known system -parent- directories are created and rights are
# copied from local system.
#
### Files
#
# (1) _install user:group ${_commonPermissions} newFile destDir/
#     * Create Empty File In Destination-Directory
#     => destDir/newFile
#
# (2) _install user:group ${_commonPermissions} sourceFile destDir/
#     * Copy Source-File Into Destination-Directory
#     => destDir/sourcFileName
#
# (3) _install user:group ${_commonPermissions} sourceFile destDir/destFileName
#     * Copy Source-File Into Destinatin-Directory With New Name
#     => destDir/destFileName
#
### Directories
# Leaf directory are created and rights are applied.
#
# (4) _install user:group ${_commonPermissions} destDir/newDir
#     * Create New Directory
#     => destDir/newDir
#
# (5) _install user:group ${_commonPermissions} sourceDir destDir/
#     * Copy Source-Directory Into Destination-Directory
#     => destDir/sourceDirName
#
# (6) _install user:group ${_commonPermissions} sourceDir destDir
#     * Copy Content of Source-Directory Into Destination-Directory
#     => destDir/sourceDirContent
#
# https://www.shellbefehle.de/befehle/chmod/
_install() {
    local _chown="$1"
    local _chmodDir="$2"
    local _chmodFile="$3"

    ### Directories
    # (4) Create New Directory
    if [ -z "$5" ];
    then
	local _dest="$4"
	_mkParentDir "${_dest}"
	if [ ! -e "${_dest}" ];
	then
	    mkdir "${_dest}"
	fi
	chown ${_chown} ${_dest}
	chmod "${_chmodDir}" ${_dest}
	return 0
    fi

    local _source=$4
    local _dest=$5
    if [ -d "${_source}" ];
    then
	if [[ ${_dest} == */ ]];
	then
	    # (5) Copy Source-Directory Into Destination-Directory
	    _dest="${_dest}$(basename ${_source})"
	fi

	_mkParentDir "${_dest}"

	# (5),(6) Copy Content of Source-Directory Into Destination-Directory
	if [ ! -e "${_dest}" ];
	then
	    mkdir "${_dest}"
	fi
	cp -fRT ${_source} ${_dest}
	find ${_dest} -exec chown "${_chown}" {} \;
	find ${_dest} -type f -exec chmod "${_chmodFile}" {} \;
	find ${_dest} -type d -exec chmod "${_chmodDir}" {} \;
	return 0
    fi

    ### Files
    if [[ ${_dest} == */ ]];
    then
	# (2) Copy Source-File Into Destination-Directory
	_dest=${_dest}$(basename ${_source})
    fi

    _mkParentDir "${_dest}"
    if [ ! -f "${_source}" ];
    then
	# (1) Create Empty File In Destination-Directory
	touch ${_dest}
    else
	# (1),(3) Copy Source-File Into Destinatin-Directory With New Name
	cp -fL ${_source} ${_dest}
    fi
    chown ${_chown} ${_dest}
    chmod "${_chmodFile}" ${_dest}
}

# Creates known System -parent- directories and copies
# permissions.
_mkParentDir() {
    local _destParent="$(dirname $1)"
    if [ -e "${_destParent}" ];
    then
	return 0
    fi

    # Check System Directory
    find / -maxdepth 1 -mindepth 1 -type d -print0 | while read -d $'\0' _rootDir
    do
        if [[ "${_destParent}" == *${_rootDir}* ]];
        then
	    _destSystemPath=$(echo ${_destParent} | grep -o "${_rootDir}.*")
	    if [ -d "${_destSystemPath}" ];
	    then
		mkdir -p ${_destParent}
		chmod --reference=${_destSystemPath} ${_destParent}
		chown --reference=${_destSystemPath} ${_destParent}
		break;
	    fi
	fi
    done

    if [ ! -e "${_destParent}" ];
    then
	_knownSystemDirectories=(
	    'usr/share/webapps'
	    'etc/webapps'
				)
	for _knownSystemDirectory in "${_knownSystemDirectories[@]}"
	do
	    if [[ ${_destParent} == *${_knownSystemDirectory} ]];
	    then
		mkdir -p ${_destParent}
		break;
	    fi
	done
    fi

    if [ ! -e "${_destParent}" ];
    then
	echo "Parent not found (${_destParent}). Maybe its a not known System-Directory:"
	for _systemDirectory in "${_systemDirectories[@]}"
	do
	    echo "   ${_systemDirectory}"
	done
	exit 1
    fi
}
# template end;

# compressStatic /usr/share/webapps/xxx 'htm|css|html|js'
_compressStatic() {
    _dir=$1
    if [ -z "$2" ];
    then
        _fileExtensions='htm|css|html|js'
    fi

    find ${_dir} -type f -regextype posix-extended -regex '.*\.('${_fileExtensions}')' -print0 \
        | while read -d $'\0' _staticFile
    do
        if [ -f "${_staticFile}".gz ]
        then
            FILE_ORIG=$(stat -c %Y "${_staticFile}")
            FILE_GZIP=$(stat -c %Y "${_staticFile}".gz)
            if [ $FILE_ORIG -gt $FILE_GZIP ]
            then
                rm "${_staticFile}".gz
                gzip -k -9 "${_staticFile}"
                echo "Deleted old .gz and created new one at: ${_staticFile}.gz"
            else
                echo "Skipping - Already up to date: ${_staticFile}.gz"
            fi
        else
            gzip -k -9 "${_staticFile}"
            echo "Created new: ${_staticFile}.gz"
        fi
    done
}
# template end;

if [ -f "src/${pkgname}/config.php" ];
then
    backup=(
	"${_confDir}/config.php"
	   )
fi

_pluginName=${_basePkgName//kopano-webapp-/}
build() {
    # Build-Environment
    _kopanoWebappDir="${srcdir}/kopano-webapp"
    cp -R /usr/share/webapps/kopano-webapp \
	${_kopanoWebappDir}
    cp -R /usr/share/doc/kopano-webapp/tools \
	${_kopanoWebappDir}/
    mkdir -p ${_kopanoWebappDir}/plugins
    mkdir -p ${_kopanoWebappDir}/deploy

    cp -R ${srcdir}/${pkgname} \
	kopano-webapp/plugins/${_pluginName}
    cd kopano-webapp/plugins/${_pluginName}
    if [ -f 'Makefile' ];
    then
	# htmleditor-quill, htmleditor-jodit, htmleditor-minimaltiny is using DESTDIR ?= deploy
	# SMIME is using DEPLOY instead of standard variable DESTDIR
	make deploy \
	    DESTDIR="../../deploy/plugins/${_pluginName}" \
	    DEPLOY="../../deploy/plugins/${_pluginName}"

    elif [ -f "build.xml" ];
    then
	# Fetchmail is using different root-, target-folder
	ant deploy \
	    -Droot-folder="$(pwd)/../../" \
	    -Dtarget-folder="$(pwd)/../../deploy/plugins"

    else
	echo "Nothing to build."

    fi
}

package() {
    # Override
    _binDir=usr/share/webapps/kopano-webapp/plugins/${_pluginName}

    # BIN
    cd ${srcdir}/kopano-webapp/deploy/plugins/${_pluginName}
    _install root:root ${_commonPermissions} . \
        ${pkgdir}/${_binDir}
    _compressStatic ${pkgdir}/${_binDir}

    # CONF
    if [ -e "${pkgdir}/${_binDir}/config.php" ];
    then
        cp ${pkgdir}/${_binDir}/config.php \
	    ${pkgdir}/${_binDir}/config.php.dist
	_install http:http ${_securePermissions} ${pkgdir}/${_confDir}
	_install http:http ${_securePermissions} ${pkgdir}/${_binDir}/config.php \
	    ${pkgdir}/${_confDir}/
        ln -sf ${_confDir}/config.php \
	    ${pkgdir}/${_binDir}/config.php
    fi

    # DOC
    if [ -e "${srcdir}/${_phpIni}" ];
    then
	_install root:root ${_commonPermissions} ${pkgdir}/${_docDir}
	_install root:root ${_commonPermissions} ${srcdir}/${_phpIni} \
	    ${pkgdir}/${_docDir}/
    fi

    # LICENSE
    for _licenseFile in LICENSE.txt AGPL-3
    do
	if [ -e "${pkgdir}/${_binDir}/${_licenseFile}" ];
	then
	    _install root:root ${_commonPermissions} ${pkgdir}/${_licenseDir}
	    _install root:root ${_commonPermissions} ${pkgdir}/${_binDir}/${_licenseFile} \
		${pkgdir}/${_licenseDir}/
	fi
    done

    # STATE
    _install http:http ${_securePermissions} ${pkgdir}/${_stateDir}

    # OTHER: PHP
    if [ -e '${srcdir}/${_phpIni}' ];
    then
	_install root:root ${_commonPermissions} ${srcdir}/${_phpIni} \
	    ${pkgdir}/etc/php/conf.d/
    fi
}

# _setConfig PLUGIN_MDM_USER_DEFAULT_ENABLE_MDM true config.php
_setConfig() {
    local _configAttribute="$1"
    local _configValue="$2"
    local _configFile="$(echo $3 | sed 's|\"|\\"|g')"
    sed -i -e "s|\(${_configAttribute}', \)\(.*\)\();$\)|\1${_configValue}\3|" ${_configFile}
}
# template end;

prepare() {
    cd ${srcdir}/${pkgname}
    mv webapp/plugins/spreedwebrtc/* ./

    sed -i 's|config.php.dist|config.php|g' build.xml
    mv config.php.dist config.php
}
