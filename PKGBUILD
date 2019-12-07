# Maintainer: robertfoster

pkgname=(
    'zimbra'
    'zimbra-packages'
)
pkgbase=zimbra
pkgver=8.8.15.p5
pkgrel=1
pkgdesc="An enterprise-class email calendar and collaboration solution built for the cloud both public and private"
arch=(x86_64)
url="https://www.zimbra.com/open-source-email-overview/"
license=('CPAL')
depends=('java-runtime>=11' 'perl-data-uuid' 'perl-net-ldap-server')
makedepends=('maven' 'ant' 'java-hamcrest' 'jdk8-openjdk' 'junit' 'lsb-release' 'rsync' 'ruby')
install=
source=("https://github.com/Zimbra/zm-build/archive/$pkgver.tar.gz" # Repo list is synced with instructions/FOSS_repo_list.pl
    "git+https://github.com/Zimbra/ant-1.7.0-ziputil-patched"
    "git+https://github.com/Zimbra/ant-tar-patched"
    "git+https://github.com/Zimbra/ical4j-0.9.16-patched"
    "git+https://github.com/kohlschutter/junixsocket#tag=junixsocket-parent-2.0.4"
    "git+https://github.com/Zimbra/nekohtml-1.9.13"
    "git+https://github.com/Zimbra/java-html-sanitizer-release-20190610.1"
    "git+https://github.com/Zimbra/antisamy#branch=develop"
    "git+https://github.com/Zimbra/zm-admin-console"
    "git+https://github.com/Zimbra/zm-admin-help-common"
    "git+https://github.com/Zimbra/zm-ajax"
    "git+https://github.com/Zimbra/zm-admin-ajax"
    "git+https://github.com/Zimbra/zm-amavis"
    "git+https://github.com/Zimbra/zm-aspell"
    "git+https://github.com/Zimbra/zm-bulkprovision-admin-zimlet"
    "git+https://github.com/Zimbra/zm-bulkprovision-store"
    "git+https://github.com/Zimbra/zm-certificate-manager-admin-zimlet"
    "git+https://github.com/Zimbra/zm-certificate-manager-store"
    "git+https://github.com/Zimbra/zm-charset"
    "git+https://github.com/Zimbra/zm-clam-scanner-store"
    "git+https://github.com/Zimbra/zm-clientuploader-admin-zimlet"
    "git+https://github.com/Zimbra/zm-clientuploader-store"
    "git+https://github.com/Zimbra/zm-core-utils"
    "git+https://github.com/Zimbra/zm-db-conf"
    "git+https://github.com/Zimbra/zm-dnscache"
    "git+https://github.com/Zimbra/zm-downloads"
    "git+https://github.com/Zimbra/zm-freshclam"
    "git+https://github.com/Zimbra/zm-help"
    "git+https://github.com/Zimbra/zm-helptooltip-zimlet"
    "git+https://github.com/Zimbra/zm-jetty-conf"
    "git+https://github.com/Zimbra/zm-jython"
    "git+https://github.com/Zimbra/zm-launcher"
    "git+https://github.com/Zimbra/zm-ldap-utilities"
    "git+https://github.com/Zimbra/zm-ldap-utils-store"
    "git+https://github.com/Zimbra/zm-licenses"
    "git+https://github.com/Zimbra/zm-mailbox"
    "git+https://github.com/Zimbra/zm-migration-tools"
    "git+https://github.com/Zimbra/zm-mta"
    "git+https://github.com/Zimbra/zm-nginx-conf"
    "git+https://github.com/Zimbra/zm-nginx-lookup-store"
    "git+https://github.com/Zimbra/zm-openid-consumer-store"
    "git+https://github.com/Zimbra/zm-pkg-tool"
    "git+https://github.com/Zimbra/zm-postfix"
    "git+https://github.com/Zimbra/zm-proxy-config-admin-zimlet"
    "git+https://github.com/Zimbra/zm-ssdb-ephemeral-store"
    "git+https://github.com/Zimbra/zm-taglib"
    "git+https://github.com/Zimbra/zm-timezones"
    "git+https://github.com/Zimbra/zm-versioncheck-admin-zimlet"
    "git+https://github.com/Zimbra/zm-versioncheck-store"
    "git+https://github.com/Zimbra/zm-versioncheck-utilities"
    "git+https://github.com/Zimbra/zm-viewmail-admin-zimlet"
    "git+https://github.com/Zimbra/zm-web-client"
    "git+https://github.com/Zimbra/zm-webclient-portal-example"
    "git+https://github.com/Zimbra/zm-zcs"
    "git+https://github.com/Zimbra/zm-zcs-lib"
    "git+https://github.com/Zimbra/zm-zimlets"
    "git+https://github.com/Zimbra/zm-oauth-social"
    "git+https://github.com/Zimbra/zm-gql"
#    "packages::git+https://github.com/Zimbra/packages#branch=bugfix/ZCS-6172"
    "zimbra.sysusers"
    "zimbra.tmpfiles"
    "localconfig.xml"
)
noextract=()

# Zimbra Configuration Variables
_buildno=3869
_buildtype="FOSS"
_major=`echo "${pkgver}" | cut -d'.' -f1`
_micro=`echo "${pkgver}" | cut -d'.' -f3`
_minor=`echo "${pkgver}" | cut -d'.' -f2`
_os="Arch"
_ostag="urolling"
_rc="GA"
_release="JOULES"
_releaseno="${pkgver%.*}"
_timestamp=`date +'%Y%m%d'`

prepare() {
    cd "$srcdir"
    
    # Bypass build.pl git checkout
    sed -i 's/Checkout($all_repos)/#Checkout($all_repos)/g' \
    "zm-build-$pkgver"/build.pl
    
    # Bypass deb generation
    sed -i 's/Die("Unknown PACKAGING format");/print("Arch Linux PACKAGING format\n");/g' \
    zm-pkg-tool/pkg-build.pl
    sed -i 's/return "deb"/return "tar.xz"/g' \
    zm-pkg-tool/pkg-build.pl
    sed -i '/echo "OS not supported./{n;s/.*//}' \
    "zm-build-$pkgver"/instructions/bundling-scripts/utils.sh
    
    # Fix zimbra-package-stub RELEASE descriptors
    mkdir -p zimbra-package-stub/version
    echo "${_major}" > zimbra-package-stub/version/MAJOR
    echo "${_minor}" > zimbra-package-stub/version/MINOR
    echo "${_micro}_${_rc}" > zimbra-package-stub/version/MICRO
}

build() {
    cd "$srcdir/zm-build-$pkgver"
    
    # Set JDK 8 as runtime
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
    export JAVA_PATH=/usr/lib/jvm/java-8-openjdk/bin
    
    # Let's build for real now
    ./build.pl -build-no=${_buildno} --build-ts=${_timestamp} \
    --build-release=${_release} --build-release-no=${_releaseno} \
    --build-os=${_os} --build-release-candidate=${_rc} --build-type=${_buildtype} \
    --build-arch=$CARCH --pkg-os-tag=${_ostag} \
    --build-thirdparty-server=files.zimbra.com --no-interactive \
    --build-prod-flag --disable-bundle --ant-options="-DskipTests=1"
}

package_zimbra() {
    cd "$srcdir"
    cd .staging/${_os}-${_release}-${_major}${_minor}${_micro}-${_timestamp}-${_buildtype}-${_buildno}
    find . -type d -name "opt" -exec rsync -av {} "$pkgdir" \;
    find . -type d -name "opt" | xargs rm -rf
    find . -type d -name "etc" -exec rsync -av {} "$pkgdir" \;
    find . -type d -name "etc" | xargs rm -rf
    rsync -av "$srcdir/zm-mailbox/build/stage/zimbra-common-core-jar/opt" "$pkgdir"
    chmod 750 -R $pkgdir/etc/sudoers.d
    chmod +x $pkgdir/opt/zimbra/bin/*
    
    # systemd
    #	install -D -m644 "${srcdir}/zimbra.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -D -m644 "${srcdir}/zimbra.sysusers" "${pkgdir}/usr/lib/sysusers.d/zimbra.conf"
    install -D -m644 "${srcdir}/zimbra.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/zimbra.conf"

    # Using a pregenerated localconfig.xml to set JRE
    install -D -m644 "${srcdir}/localconfig.xml" "${pkgdir}/opt/zimbra/conf/localconfig.xml"
}

package_zimbra-packages() {
    cd "$srcdir"
}
md5sums=('0be0a8118803e607245bbd66404fd58c'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '21b3bdbcb2d23357104122df3de217b5'
         '84ad300287d602d4d6b2601748ddbaac'
         '66f2930f13484ae782a162e8e7da28c1')
