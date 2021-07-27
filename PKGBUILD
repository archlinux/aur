# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>
# Contributor: MartiMcFly <martimcfly [at] autorisation.de>

# Administrator Manual: https://documentation.kopano.io/kopanocore_administrator_manual/
# User Manual: http://documentation.kopano.io/user_manual_kopanocore
# Migration 7.2.1: https://documentation.kopano.io/kopano_migration_manual/KopanoMigrationManual.pdf
pkgname='kopano-core-git'
pkgver='10.0.7'
pkgrel='1'
pkgdesc='Foundation for groupware messaging enabling clients'
groups=(
    'kopano'
    )
arch=(
    'armv7h'
    'aarch64'
    'i686'
    'x86_64'
     )
url='https://www.kopano.com/'
license=(
    'AGPL3'
	)

_tagPrefix="kopanocore-"
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
source=(
    "${pkgname}::git+https://stash.kopano.io/scm/kc/kopanocore.git${_sourceBranch}"
	)
md5sums=(
    'SKIP'
	)

makedepends=(
    # CORE: https://stash.kopano.io/projects/KC/repos/kopanocore/browse/doc/install.txt
    # Mandatory build-time dependencies
    'gcc'
    'binutils>=2.22'
    'pkgconf'
    'gsoap>=2.8.73'
    'icu>=52'
    'libxcrypt' # for:libcrypt with crypt_r
    'gettext'
    'libical>=0.9'
    'libiconv' # src:https://aur.archlinux.org/packages/libiconv/
    'openssl' # for:librcrypto/libssl
    'ncurses>=5'
    'util-linux-libs' # libuuid
    'libvmime>=0.9.2' # version:>=0.9.2k2 src:https://aur.archlinux.org/packages/kopano-libvmime/
    'libxml2'
    'mariadb-libs>=5.1' # for:MariaDB Connector/C 3.0 or MySQL Connector/C 5.1
    'xapian-core' # version:>=1.2.21
    'zlib' # version:>=1.2
    #
    # Optional build-time dependencies
    'gperftools>=2'
    'krb5'
    'curl>=7' # libcurl
    'pam>=1'
    'openldap>=2.4'
    'php>=7'
    'python>=3'
    'swig>=2.0'
    #
    # Optional build-time dependencies: Unmentioned
    'libhx>=1.10'
    #
    # Optional build-time dependencies: Unsupported
    # 'libs3' # src:https://aur.archlinux.org/packages/libs3-git/
    # 'rrdtool>=1.3'

    # PKGBUILD
    'git'
    'sed'
	    )
depends=(
    # CORE: https://stash.kopano.io/projects/KC/repos/kopanocore/browse/doc/install.txt
    'mariadb>=5.1.73'

    # SEARCH: https://stash.kopano.io/projects/KC/repos/kopanocore/browse/ECtools/search/requirements.txt
    'python-xapian'
    'python-bsddb'
    #
    # Attachment Parser
    # https://stash.kopano.io/projects/KC/repos/kopanocore/browse/ECtools/search/kopano_search/plaintext.py
    'python-magic'
    #
    # https://stash.kopano.io/projects/KC/repos/kopanocore/browse/installer/searchscripts/attachments_parser.db
    'libiconv'
    'w3m'
    'poppler' # for:pdftotext
    'catdoc' # for:catdoc,catppt,xls2csv
    'libxslt' # for:xsltproc
    'unzip'
    'gawk'


    # SPAMD: https://stash.kopano.io/projects/KC/repos/kopanocore/browse/ECtools/spamd/requirements.txt
    # Duplicate
    # 'python-bsddb'


    # BACKUP: https://stash.kopano.io/projects/KC/repos/kopanocore/browse/ECtools/backup/requirements.txt
    # Duplicate
    # 'python-bsddb'


    # SWIG: https://stash.kopano.io/projects/KC/repos/kopanocore/browse/swig/python/kopano/requirements.txt
    'python-pytz'
    'python-tzlocal'
    'python-dateutil'
    'python-pilkit'
        )
optdepends=(
    # CORE
    'gperftools' # for:libtcmalloc
    # Unsupported
    # 'libs3'
	    )

# TODO _licenseDir is supposed to be the pkgname. For unification changed here.
_confDir="etc/kopano"
_licenseDir="usr/share/licenses/kopano"
_docDir="usr/share/doc/kopano"

install='install'
for _configFile in src/${pkgname}/installer/linux/*.cfg; do
    backup+=("${_confDir}/$(basename ${_configFile})")
done

prepare() {
    cd ${srcdir}/${pkgname}
    _patchFromGit https://github.com/pietmacom/kopano-core.git
    return 0

    case "${_sourceBranch}" in
	${_tagPrefix}10*)
	;&
	${_tagPrefix}11*)
	    _patchFromGit https://github.com/pietmacom/kopano-core.git master master-patch
	;;
	*)
	;;
    esac
}

# When using official VMIME
_officialVmimeParameter() {
    if ! pacman -Qi kopano-libvmime > /dev/null 2> /dev/null \
	&& ! pacman -Qi kopano-libvmime-git > /dev/null 2> /dev/null;
    then
	# VMIME_CFLAGS='$(pkg-config vmime --cflags)' VMIME_LIBS='$(pkg-config vmime --libs)'
	# echo -n "VMIME_CFLAGS=$(pkg-config vmime --cflags) VMIME_LIBS=$(pkg-config vmime --libs)"
	echo -n "VMIME_CFLAGS='-I/usr/include/vmime/' VMIME_LIBS='-lvmime'"
    fi
}

# https://stash.kopano.io/projects/KC/repos/kopanocore/browse/Dockerfile.build
build() {
    cd ${srcdir}/${pkgname}

    ./bootstrap.sh
    ./configure \
`# https://stash.kopano.io/projects/KC/repos/kopanocore/browse/doc/install.txt#68` \
    $(_officialVmimeParameter) \
`# https://stash.kopano.io/projects/KC/repos/kopanocore/browse/Jenkinsfile` \
    TCMALLOC_CFLAGS=' ' \
    TCMALLOC_LIBS='-ltcmalloc_minimal' \
    PYTHON="$(which python3)" \
    PYTHON_CFLAGS="$(pkg-config python3 --cflags)" \
    PYTHON_LIBS="$(pkg-config python3 --libs)" \
    --enable-release \
    --enable-pybind \
    \
`# https://documentation.kopano.io/kopanocore_administrator_manual/compiling_from_source.html` \
    --enable-epoll \
    --enable-unicode \
    --enable-python \
    --disable-static \
    --with-userscript-prefix='/etc/kopano/userscripts' \
    --with-quotatemplate-prefix='/etc/kopano/quotamails' \
    \
`# Arch specific` \
    --prefix='/usr' \
    --sbindir='$(prefix)/bin' \
    --localstatedir='/var' \
    --sysconfdir='/etc' \
    --with-searchscripts-prefix='/etc/kopano/searchscripts'

    make
}

package() {
    cd ${srcdir}/${pkgname}

    # BASE
    # => multithreaded build breaks everything
    export MAKEFLAGS="-j1"
    make install DESTDIR="$(realpath ${pkgdir})"

    # LICENSE
    mkdir -p ${pkgdir}/${_licenseDir}
    cp CONTRIBUTING.md AGPL-3 LICENSE.txt \
	${pkgdir}/${_licenseDir}/

    # DOC
    cp RELNOTES.txt \
	"${pkgdir}/${_docDir}"

    cp -r "${pkgdir}/${_docDir}/example-config" \
	"${pkgdir}/${_docDir}/installed-config"
    prepare_configs "${pkgdir}/${_docDir}/installed-config"

    # CONF
    for _configFile in ${pkgdir}/${_docDir}/installed-config/*.cfg; do
	_pkgConfigFile="${pkgdir}/${_confDir}/$(basename ${_configFile})"
	cp ${_configFile} ${_pkgConfigFile}
#	chown kopano:kopano ${_pkgConfigFile}
	chmod 0600 ${_pkgConfigFile}
    done
}

# User-Scripts

prepare_configs() {
    # Common
    config_path="$1"
    run_as_user="kopano"
    run_as_group="kopano"
    running_path="/var/lib/kopano"
    server_socket="/var/run/kopano/server.sock"
    server_socket_prio="/var/run/kopano/prio.sock"
    search_socket="/var/run/kopano/search.sock"
    ssl_protocols="TLSv1 TLSv1\.1 TLSv1\.2"
    ssl_ciphers="AES256\+EECDH:AES256\+EDH:\!aNULL"
    ssl_privatekey="/etc/ssl/private/kopano.key"
    ssl_certificate="/etc/ssl/private/kopano.crt"

    # => service
    # => server-connection (socket only)
    # => individual

    # https://stash.kopano.io/projects/KC/repos/kopanocore/browse/doc/kopano-server.cfg.5
    config_file="${config_path}/server.cfg"
    set_config "run_as_user" "${run_as_user}" ${config_file}
    set_config "run_as_group" "${run_as_group}" ${config_file}
    set_config "log_method" "syslog" ${config_file}  
    set_config "log_file" "-" ${config_file}
    set_config "log_level" "3" ${config_file}
    set_config "server_pipe_name" "${server_socket}" ${config_file}
    set_config "server_pipe_priority" "${server_socket_prio}" ${config_file}
    set_config "server_listen" "" ${config_file}
    set_config "server_listen_tls" "" ${config_file}
    set_config "server_ssl_prefer_server_ciphers" "yes" ${config_file}
    set_config "server_ssl_protocols" "${ssl_protocols}" ${config_file}
    set_config "server_ssl_ciphers" "${ssl_ciphers}" ${config_file}
    set_config "server_ssl_key_file" "${ssl_privatekey}" ${config_file}
    set_config "server_ssl_key_pass" "" ${config_file}
    set_config "server_ssl_ca_file" "${ssl_certificate}" ${config_file}
    set_config "server_ssl_ca_path" "/etc/ssl/certs" ${config_file}
    # => individual
    set_config "attachment_storage" "files" ${config_file} 
    set_config "attachment_compression" "0" ${config_file}
    set_config "disabled_features" "" ${config_file}
    set_config "hide_everyone" "yes" ${config_file}
    set_config "search_enabled" "yes" "${config_file}"
    set_config "search_socket" "file://${search_socket}" "${config_file}"
    set_config "mysql_socket" "/run/mysqld/mysqld.sock" ${config_file}
    set_config "mysql_user" "kopano" ${config_file}
    set_config "mysql_password" "kopano" ${config_file}

    # https://stash.kopano.io/projects/KC/repos/kopanocore/browse/doc/kopano-archiver.cfg.5
    config_file="${config_path}/archiver.cfg"
    set_config "log_method" "syslog" ${config_file}  
    set_config "log_file" "-" ${config_file}
    set_config "log_level" "3" ${config_file}
    set_config "server_socket" "file://${server_socket}" ${config_file}

    # https://stash.kopano.io/projects/KC/repos/kopanocore/browse/doc/kopano-backup.cfg.5
    config_file="${config_path}/backup.cfg"
    set_config "log_method" "syslog" ${config_file}  
    set_config "log_file" "-" ${config_file}
    set_config "log_level" "3" ${config_file}
    set_config "server_socket" "file://${server_socket}" ${config_file}

    # https://stash.kopano.io/projects/KC/repos/kopanocore/browse/doc/kopano-dagent.cfg.5
    config_file="${config_path}/dagent.cfg"
    set_config "run_as_user" "${run_as_user}" ${config_file}
    set_config "run_as_group" "${run_as_group}" ${config_file}
    set_config "log_method" "syslog" ${config_file}  
    set_config "log_file" "-" ${config_file}
    set_config "log_level" "3" ${config_file}
    set_config "server_bind" "127.0.0.1" ${config_file}
    set_config "server_socket" "file://${server_socket}" ${config_file}

    # https://stash.kopano.io/projects/KC/repos/kopanocore/browse/doc/kopano-gateway.cfg.5
    config_file="${config_path}/gateway.cfg"
    set_config "log_method" "syslog" ${config_file}  
    set_config "log_file" "-" ${config_file}
    set_config "log_level" "3" ${config_file}
    set_config "server_bind" "127.0.0.1" ${config_file}
    set_config "server_socket" "file://${server_socket}" ${config_file}
    set_config "ssl_prefer_server_ciphers" "yes" ${config_file}   
    set_config "ssl_protocols" "${ssl_protocols}" ${config_file}
    set_config "ssl_ciphers" "${ssl_ciphers}" ${config_file}
    set_config "ssl_private_key_file" "${ssl_privatekey}" ${config_file}   
    set_config "ssl_certificate_file" "${ssl_certificate}" ${config_file}   
    # => individual
    # avoid requests to be upgraded to admin privileges
    set_config "run_as_user" "nobody" ${config_file}
    set_config "run_as_group" "nobody" ${config_file}
    set_config "imap_generate_utf8" "no" "${config_file}"
    set_config "imap_public_folders" "yes" "${config_file}"
    set_config "process_model" "fork" ${config_file}

    # https://stash.kopano.io/projects/KC/repos/kopanocore/browse/doc/kopano-ical.cfg.5
    config_file="${config_path}/ical.cfg"
    set_config "log_method" "syslog" ${config_file}  
    set_config "log_file" "-" ${config_file}
    set_config "log_level" "3" ${config_file}
    set_config "server_bind" "127.0.0.1" ${config_file}
    set_config "server_socket" "file://${server_socket}" ${config_file}
    set_config "ssl_prefer_server_ciphers" "yes" ${config_file}
    set_config "ssl_protocols" "${ssl_protocols}" ${config_file}
    set_config "ssl_ciphers" "${ssl_ciphers}" ${config_file}
    set_config "ssl_private_key_file" "${ssl_privatekey}" ${config_file}
    set_config "ssl_certificate_file" "${ssl_certificate}" ${config_file}
    # => individual
    # avoid requests to be upgraded to admin privileges
    set_config "process_model" "fork" ${config_file}
    set_config "run_as_user" "nobody" ${config_file}
    set_config "run_as_group" "nobody" ${config_file}

    # https://stash.kopano.io/projects/KC/repos/kopanocore/browse/doc/kopano-monitor.cfg.5
    config_file="${config_path}/monitor.cfg"
    set_config "run_as_user" "${run_as_user}" ${config_file}
    set_config "run_as_group" "${run_as_group}" ${config_file}
    set_config "log_method" "syslog" ${config_file}
    set_config "log_file" "-" ${config_file}
    set_config "log_level" "3" ${config_file}
    set_config "server_socket" "file://${server_socket}" ${config_file}

    # https://stash.kopano.io/projects/KC/repos/kopanocore/browse/doc/kopano-unix.cfg.5

    # https://stash.kopano.io/projects/KC/repos/kopanocore/browse/doc/kopano-search.cfg.5
    config_file="${config_path}/search.cfg"
    set_config "run_as_user" "${run_as_user}" ${config_file}
    set_config "run_as_group" "${run_as_group}" ${config_file}
    set_config "log_method" "syslog" ${config_file}  
    set_config "log_file" "-" ${config_file}
    set_config "log_level" "3" ${config_file}
    set_config "server_socket" "file://${server_socket}" ${config_file}
    set_config "server_bind_name" "file://${search_socket}" "${config_file}"
    set_config "ssl_private_key_file" "${ssl_privatekey}" ${config_file}   
    set_config "ssl_certificate_file" "${ssl_certificate}" ${config_file}   
    # => individual
    set_config "index_attachements" "yes" "${config_file}"

    # https://stash.kopano.io/projects/KC/repos/kopanocore/browse/doc/kopano-spooler.cfg.5
    cfg="${config_path}/spooler.cfg" 
    set_config "run_as_user" "${run_as_user}" ${config_file}
    set_config "run_as_group" "${run_as_group}" ${config_file}
    set_config "log_method" "syslog" ${config_file}  
    set_config "log_file" "-" ${config_file}
    set_config "log_level" "3" ${config_file}
    set_config "server_socket" "file://${server_socket}" ${config_file}
    # => individual
    set_config "allow_send_to_everyone" "no" "${config_file}"
}

set_config() {
    local config_attribute="$1"
    local config_attribute_prefix=$(echo -n "${config_attribute}" | sed "s|\(_\).*|\1|")
    local config_value="$2"
    local config_file="$3"

    # Uncomment And Set Attribute
    if grep -q "${config_attribute}" ${config_file} ;
    then
	# Uncomment (Replaces Optional Comments And Spaces)
	sed -i "s|^#*\s*\(${config_attribute}.*\)|\1|" ${config_file}

	# Set ("name = value" => "name = newvalue")
	sed -i "s|^\(${config_attribute}\)\s*\=.*|\1 = ${config_value}|" ${config_file}

    # Add Attribute At Right Position
    elif [ ! -z "${config_attribute_prefix}" ] \
	&& grep -q "${config_attribute_prefix}" ${config_file} ;
    then
	# Find Last Attribut From Prefix-Group
	local config_attribute_last_from_group=$(tac ${config_file} | grep -m 1 "^#*\s*${config_attribute_prefix}" | grep -o "${config_attribute_prefix}[^ =]*")
	sed -i "s|\(${config_attribute_last_from_group}.*$\)|\1\n${config_attribute} = ${config_value}|" ${config_file}

    # Add Attribute At The End of File 
    else
	sed -i -z "s|\(.*[^\n]\)|\1\n${config_attribute} = ${config_value}|" ${config_file}

    fi
}