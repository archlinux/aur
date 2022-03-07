# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=filebeat-bin
pkgver=8.0.1
pkgrel=1
pkgdesc='Filebeat sends log files to Logstash or directly to Elasticsearch'
arch=('i686' 'x86_64')
url='https://www.elastic.co/beats/filebeat'
license=('custom:Elastic')
backup=('etc/filebeat/filebeat.yml')
optdepends=('elasticsearch: for running standalone installation')
options=('!strip')
source_i686=("https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$pkgver-arm64.deb")
source_x86_64=("https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$pkgver-amd64.deb")
source=(
    'filebeat.sysusers'
    'filebeat.tmpfiles'
)
sha512sums_i686=('8658cf3fd1a1146d36e793ad0d44e1de4b103d3ed1608421989f7e39f88a94942b7a13a4495ea2efd0d893ebe58d2224d6714ec9808b7d7656d92046aeae83cb')
sha512sums_x86_64=('a47fb63bf140bd1f9c7d395b6c28a5be3363e424af38d885b053d0a3cb6c57552ea353735b31baf31c186a786a1f8b44ea1729665b2f1b6ade492b2411965a01')
sha512sums=(
    'a8b689a8b741d1ed730056a03d5ea01600fc72caea2fd70d404727e0b79436a6af7185b5e39b9ead860dc4c0f232542b75b5c30647d10f4437a93629ed07649e'
    '9e37bb768681915596d3ed29d4ba6241b41d7be5bdeb0950219d67c177e942a52f48bc69ea44bcc7166296368432e30d49aae6b1bfc03326d6994e3612000bf3'
)

prepare() {
    tar -xf data.tar.gz
    rm -rf etc/init.d
    mv lib usr
    chmod 644 etc/filebeat/filebeat.yml
    sed -i '/^\[Service\]$/{n;s/.*/User=filebeat/}' usr/lib/systemd/system/filebeat.service
}

package() {
    install -Dm644 filebeat.sysusers "$pkgdir/usr/lib/sysusers.d/filebeat.conf"
    install -Dm644 filebeat.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/filebeat.conf"
    cp -r etc usr "$pkgdir/"
}
