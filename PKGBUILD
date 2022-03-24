# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tyler Langlois <ty |at| tjll |dot| net>

pkgbase='beats-oss'
pkgname=(
    'metricbeat-oss'
    'filebeat-oss'
    'packetbeat-oss'
    'heartbeat-oss'
    'auditbeat-oss'
    'journalbeat-oss'
)
pkgver=7.12.1
pkgrel=2
pkgdesc='Data shippers for Elasticsearch OSS or OpenSearch'
arch=('x86_64')
url='https://opensearch.org/docs/latest/clients/agents-and-ingestion-tools/index/'
license=('Apache')
depends=('glibc')
makedepends=('go' 'git' 'libpcap' 'rsync' 'python-virtualenv' 'audit' 'systemd' 'mage')
optdepends=('opensearch: for standalone installation')
options=('!makeflags')
source=("https://github.com/elastic/beats/archive/v$pkgver/beats-$pkgver.tar.gz"
    "filebeat-oss.service"
    "packetbeat-oss.service"
    "metricbeat-oss.service"
    "heartbeat-oss.service"
    "auditbeat-oss.service"
    "journalbeat-oss.service"
    "tmpfile.conf"
    "0001-common-seccomp-add-rseq-syscall-30620.patch")
sha512sums=('3e2c49ddab59461f82abc5e3ea0f12941f2ed73a6f23c2f062ec88c85d577ce2b5efb234a110e62e9949490bec4f355f3118508572b93883adc7122d76d33cb1'
            '405bc15510c0d39bbbf5f21db8eaa7b6a4032fd199c2115cfc6df23a32b072b40dffea524b9b779fbe624604b91d20e91d4e67e00e854ad5322ff9105609f779'
            '6aa70e01e06b23e86d62c96b8c56789de63ebfdb70903a0c9eb38dc7a919b340655ac5d197302c3962e29fdcd0c948b7f07e48fe8d9b8744e18477f47f152f13'
            '102bcde76fca054c0359caf5d075421942d0b4598e816d6f011984cf60d1d3f526f18d55e069041fde73dfb361e5a5682cc18abc858f79b344a725930802dd30'
            '10cd83b1d49115d108967ddb7af1404de6440668f9261241691ba8329384b51fadb23f302cfd57978de0423c73b8e1519bc13d2c5cb7858f00837dd719e351cb'
            '6c2b7ad706efbbaab55e2bd6a63dd85ee358aeed8255a829adeacdcd45d364520cc7f0328cfa966d61e911042d8fac40abc7ff36cdb7a834fc83df7da94fce13'
            '977a8209341891902a3edaedcab4370ab87260f88031c404dfbae7633d9b11673fa2719f81acc716cea6028a670c484092f579e560e2ba621e74682cf08efa2f'
            '47ea41af1b46077a1279acdd4940b80f03e18f96dd8c03cc93b0c297b4b08dfa8e52865774a5ba88d95cbc6c7d31a33da2e5d8c897a4e9ffb6c9974ac75ea588'
            '61878752bb0b3bb5e5ce38d9cf804398c6f7bc6ba9309a02f164edf732b81034f3186a3b717507308915a417eebfc13a0eb3a865a85a56a5938da33ee15e6c32')

prepare() {
    export GOPATH="$srcdir"/go
    mkdir -p "$GOPATH"

    cd "$srcdir"/beats-$pkgver

    # https://github.com/golang/go/issues/51315#issuecomment-1055399831
    # https://github.com/elastic/beats/pull/30620
    patch -Np1 -i "$srcdir"/0001-common-seccomp-add-rseq-syscall-30620.patch

    git init # git root required by one of the build scripts

    # Perform some timestomping to avoid make warnings
    LANG=C _t="$(date -r Makefile +'%Y-%m-%d %k:%M:%S')"
    touch -m -d "$_t" */Makefile

    # Use version instead of commit id
    sed -ri "s/^COMMIT_ID=.*/COMMIT_ID=$pkgver/" libbeat/scripts/Makefile
    sed -ri "s/\bcommitHash, err =.*/commitHash = \"$pkgver\"\nerr = nil/;/github.com\/magefile\/mage\/sh/d" dev-tools/mage/settings.go

    # Use version of MarkupSafe with fix for setuptools
    sed -i "s/MarkupSafe==1\.0/MarkupSafe==1.1.1/" libbeat/tests/system/requirements.txt

    # Missing BEAT_NAME in metricbeat Makefile
    sed -i '1i BEAT_NAME?=metricbeat' metricbeat/Makefile
}

build() {
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export GOPATH="$srcdir"/go
    export PATH="$GOPATH/bin:$PATH"

    cd "$srcdir"/beats-$pkgver
    cd libbeat
    make update

    for beat in ${pkgname[@]}; do
        beat="${beat%-oss}"
        echo "-> Building $beat..."
        cd ../$beat
        if [[ $beat == "metricbeat" ]]; then
            make mage
            mage build
        else
            make $beat
        fi
        mage update
    done
}

_do_package_beat() {
    beat="${pkgname%-oss}"

    backup=(etc/$pkgname/$beat.yml)

    install -dm755 "$pkgdir/"{etc,usr/share,usr/share/licenses,var/lib}"/$pkgname"
    install -dm755 "$pkgdir/usr/lib/tmpfiles.d"

    cd "$srcdir/beats-$pkgver"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    install -Dm644 NOTICE.txt "$pkgdir/usr/share/licenses/$pkgname/NOTICE.txt"

    cd "$beat"

    cp "$beat."{yml,reference.yml} "$pkgdir"/etc/$pkgname
    install -Dm644 fields.yml "$pkgdir"/etc/$pkgname/fields.yml

    install -Dm755 "$beat" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

    sed "s/PKGNAME/$pkgname/g" "$srcdir"/tmpfile.conf >"$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

    if [ -d build/kibana ]; then
        cp -R build/kibana "$pkgdir/usr/share/$pkgname/"
    elif [ -d _meta/kibana.generated ]; then
        cp -R _meta/kibana.generated "$pkgdir/usr/share/$pkgname/kibana"
    fi
}

package_filebeat-oss() {
    pkgdesc='Sends log files to Logstash or directly to Elasticsearch OSS or OpenSearch'

    _do_package_beat
    cp -R build/package/modules.d "$pkgdir/etc/$pkgname/"
    cp -R build/package/module "$pkgdir/usr/share/$pkgname/"
}

package_packetbeat-oss() {
    pkgdesc='Analyzes network traffic and sends the data to Elasticsearch OSS or OpenSearch'
    depends=('libpcap')

    _do_package_beat
}

package_metricbeat-oss() {
    pkgdesc='Server monitoring agent that sends metrics to Elasticsearch OSS or OpenSearch'

    _do_package_beat
    cp -R modules.d "$pkgdir/etc/$pkgname/"
}

package_heartbeat-oss() {
    pkgdesc='Ping remote services for availability and log results to Logstash or directly to Elasticsearch OSS or OpenSearch'

    _do_package_beat
    cp -R monitors.d "$pkgdir/etc/$pkgname/"
}

package_auditbeat-oss() {
    pkgdesc='Audit the activities of users and processes on your system to Elasticsearch OSS or OpenSearch'
    install='auditbeat-oss.install'

    _do_package_beat
    install -D module/auditd/_meta/audit.rules.d/sample-rules-linux-64bit.conf "$pkgdir/etc/$pkgname/audit.rules.d/sample-rules.conf.disabled"
}

package_journalbeat-oss() {
    pkgdesc='Data collector to ship systemd journal entries to Logstash or directly to Elasticsearch OSS or OpenSearch'

    _do_package_beat
}

# vim: ts=4 sw=4 et:
