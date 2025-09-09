# Maintainer: karras <karras@0x539.ch>

# Package for installing the Wazuh agent but it is built from scratch instead
# of copying files from the official RPM/DEB packages.
pkgname=wazuh-agent-src
pkgver=4.12.0
pkgrel=1
pkgdesc="Wazuh agent for endpoints providing threat prevention, detection, and response capabilities"
arch=('x86_64')
url="https://github.com/wazuh/wazuh"
license=('GPL-2.0-only')
provides=('wazuh-agent')
conflicts=('wazuh-agent')
makedepends=(
  'autoconf'
  'automake'
  'base-devel'
  'brotli'
  'cmake'
  'curl'
  'expect'
  'fakeroot'
  'gawk'
  'gcc14'
  'gnupg'
  'inetutils'
  'libsigsegv'
  'libtool'
  'make'
  'nodejs'
  'perl'
  'perl-base'
  'python'
  'sudo'
  'wget'
)
optdepends=(
  'lsb-release: for detecting the Linux distribution'
)
source=(
  "https://github.com/wazuh/wazuh/archive/v${pkgver}.tar.gz"
  wazuh-agent-src.sysusers
  wazuh-agent-src.tmpfiles
  ossec.conf
)
sha512sums=(
  '062c9fa4bbe2ec9dbabc71c4b8b87ad9e592c3ccdd2f707fd3292f64b24ce1f09bf979d09299da144e7e13bdb66ca3ad8681c9bbbede363d661b2bb1b8d6747e'
  '13e8779f5e54fc444124d29d3c26f8ceda11bfd40c4ff995a68492a8ebd6cc3ecf906e7f109bf9860bef1e8dff390fb0a3e2c61e4c597f47dc9f0f36b39f1099'
  '1a4e31e0a18371dc4fec65a388b3a8c54d3e69e2413c1584394a1c2108ade261d81e63a31dff081003a3e8913b461b0aa18c4d9f070ea2fe5921f3372238b3fd'
  'dce84e1d8af52f439abb4c9166936d8432abb1e03652e29e4485b45534d0f3b4e8048e37e247545998fbd021b7696356a2c6f992db763a60288225f70e4097be'
)
backup=(
  "opt/wazuh-agent/etc/client.keys"
  "opt/wazuh-agent/etc/local_internal_options.conf"
  "opt/wazuh-agent/etc/ossec.conf"
)

build() {
  cd "${srcdir}/wazuh-${pkgver}/src"
  # We ignore Wazuh's instructions to rely on the install.sh script since it
  # wants to be executed as root, which is undesired for Arch packages.
  #
  # Wazuh currently does not support GCC 15, see
  # https://github.com/wazuh/wazuh/issues/29931.
  make TARGET=agent deps
  make TARGET=agent installdir=/opt/wazuh-agent CC=gcc-14 CXX=g++-14 build
}

package() {
  # Add the systemd sysusers and tmpfiles configs
  install -Dm644 wazuh-agent-src.sysusers "${pkgdir}/usr/lib/sysusers.d/wazuh-agent.conf"
  install -Dm644 wazuh-agent-src.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/wazuh-agent.conf"

  # Since the Makefile has no "install" target and users are instructed to run
  # install.sh, we have to mimic it line-by-line and copy the files
  # individually. :-(
  installdir="${pkgdir}/opt/wazuh-agent"
  ossec_control_src='./init/wazuh-client.sh'

  cd "${srcdir}/wazuh-${pkgver}/src"

  # Populate agent main directory
  install -d -m 0750 ${installdir}/

  # Poulate agent version config
  install -m 440 ../VERSION.json ${installdir}/VERSION.json

  # Populate agent log directory
  install -d -m 0770 ${installdir}/logs
  install -d -m 0750 ${installdir}/logs/wazuh
  install -m 0660 /dev/null ${installdir}/logs/ossec.log
  install -m 0660 /dev/null ${installdir}/logs/ossec.json
  install -m 0660 /dev/null ${installdir}/logs/active-responses.log

  # Populate agent lib directory
  install -d -m 0750 ${installdir}/lib
  install -m 0750 libwazuhext.so ${installdir}/lib
  install -m 0750 libwazuhshared.so ${installdir}/lib
  install -m 0750 shared_modules/dbsync/build/lib/libdbsync.so ${installdir}/lib
  install -m 0750 shared_modules/rsync/build/lib/librsync.so ${installdir}/lib
  install -m 0750 data_provider/build/lib/libsysinfo.so ${installdir}/lib
  install -m 0750 syscheckd/build/lib/libfimdb.so ${installdir}/lib
  install -m 0750 syscheckd/build/lib/libfimebpf.so ${installdir}/lib
  install -m 0750 external/libbpf-bootstrap/build/libbpf/libbpf.so ${installdir}/lib
  install -m 0750 external/libbpf-bootstrap/build/modern.bpf.o ${installdir}/lib
  install -m 0750 wazuh_modules/syscollector/build/lib/libsyscollector.so ${installdir}/lib
  install -m 0750 libstdc++.so.6 ${installdir}/lib
  install -m 0750 libgcc_s.so.1 ${installdir}/lib

  # Populate agent bin directory
  install -d -m 0750 ${installdir}/bin
  install -m 0750 wazuh-logcollector ${installdir}/bin
  install -m 0750 syscheckd/build/bin/wazuh-syscheckd ${installdir}/bin
  install -m 0750 wazuh-execd ${installdir}/bin
  install -m 0750 manage_agents ${installdir}/bin
  install -m 0750 ${ossec_control_src} ${installdir}/bin/wazuh-control
  install -m 0750 wazuh-modulesd ${installdir}/bin/
  install -m 0750 wazuh-agentd ${installdir}/bin
  install -m 0750 agent-auth ${installdir}/bin

  # Populate agent queue directory
  install -d -m 0750 ${installdir}/queue
  install -d -m 0770 ${installdir}/queue/alerts
  install -d -m 0770 ${installdir}/queue/sockets
  install -d -m 0750 ${installdir}/queue/diff
  install -d -m 0750 ${installdir}/queue/fim
  install -d -m 0750 ${installdir}/queue/fim/db
  install -d -m 0750 ${installdir}/queue/syscollector
  install -m 0640 wazuh_modules/syscollector/norm_config.json ${installdir}/queue/syscollector
  install -d -m 0750 ${installdir}/queue/syscollector/db
  install -d -m 0750 ${installdir}/queue/logcollector
  install -d -m 0750 ${installdir}/queue/rids

  # Populate agent var directory
  install -d -m 0750 ${installdir}/var
  install -d -m 0770 ${installdir}/var/run
  install -d -m 0770 ${installdir}/var/upgrade
  install -d -m 0770 ${installdir}/var/selinux
  install -d -m 0770 ${installdir}/var/incoming

  # Populate agent tmp directory
  install -d -m 1770 ${installdir}/tmp

  # Populate agent etc directory
  install -d -m 0770 ${installdir}/etc
  install -m 0640 ../etc/internal_options.conf ${installdir}/etc/
  install -m 0640 ../etc/local_internal_options.conf ${installdir}/etc/local_internal_options.conf
  install -m 0640 /dev/null ${installdir}/etc/client.keys

  # We ship our own modified ossec.conf for better transparency since
  # install.sh by default uses a templating mechanism
  install -m 0660 ${srcdir}/ossec.conf ${installdir}/etc/ossec.conf

  install -m 0640 ../etc/wpk_root.pem ${installdir}/etc/
  install -d -m 0770 ${installdir}/etc/shared
  install -m 0660 ../ruleset/rootcheck/db/*.txt ${installdir}/etc/shared/

  # Adopt local timezone, if configured
  if [ -f /etc/localtime ]
  then
       install -m 0640 /etc/localtime ${installdir}/etc
  fi
  if [ -f /etc/TIMEZONE ]; then
       install -m 0640 /etc/TIMEZONE ${installdir}/etc/
  fi

  # Populate agent ruleset directory
  install -d -m 0750 ${installdir}/ruleset
  install -d -m 0750 ${installdir}/ruleset/sca
  install -m 0640 ../ruleset/sca/generic/sca_distro_independent_linux.yml ${installdir}/ruleset/sca

  # Populate agent wodles directory
  install -d -m 0750 ${installdir}/wodles
  install -d -m 0770 ${installdir}/var/wodles
  install -m 0750 ../wodles/__init__.py ${installdir}/wodles/__init__.py
  install -m 0750 ../wodles/utils.py ${installdir}/wodles/utils.py
  install -d -m 0750 ${installdir}/wodles/aws
  install -d -m 0750 ${installdir}/wodles/aws/buckets_s3
  install -d -m 0750 ${installdir}/wodles/aws/services
  install -d -m 0750 ${installdir}/wodles/aws/subscribers
  install -m 0750 ../wodles/aws/aws_s3.py ${installdir}/wodles/aws/aws-s3
  install -m 0750 ../wodles/aws/__init__.py ${installdir}/wodles/aws/__init__.py
  install -m 0750 ../wodles/aws/aws_tools.py ${installdir}/wodles/aws/aws_tools.py
  install -m 0750 ../wodles/aws/wazuh_integration.py ${installdir}/wodles/aws/wazuh_integration.py
  install -m 0750 ../wodles/aws/buckets_s3/aws_bucket.py ${installdir}/wodles/aws/buckets_s3/aws_bucket.py
  install -m 0750 ../wodles/aws/buckets_s3/cloudtrail.py ${installdir}/wodles/aws/buckets_s3/cloudtrail.py
  install -m 0750 ../wodles/aws/buckets_s3/config.py ${installdir}/wodles/aws/buckets_s3/config.py
  install -m 0750 ../wodles/aws/buckets_s3/guardduty.py ${installdir}/wodles/aws/buckets_s3/guardduty.py
  install -m 0750 ../wodles/aws/buckets_s3/__init__.py ${installdir}/wodles/aws/buckets_s3/__init__.py
  install -m 0750 ../wodles/aws/buckets_s3/load_balancers.py ${installdir}/wodles/aws/buckets_s3/load_balancers.py
  install -m 0750 ../wodles/aws/buckets_s3/server_access.py ${installdir}/wodles/aws/buckets_s3/server_access.py
  install -m 0750 ../wodles/aws/buckets_s3/umbrella.py ${installdir}/wodles/aws/buckets_s3/umbrella.py
  install -m 0750 ../wodles/aws/buckets_s3/vpcflow.py ${installdir}/wodles/aws/buckets_s3/vpcflow.py
  install -m 0750 ../wodles/aws/buckets_s3/waf.py ${installdir}/wodles/aws/buckets_s3/waf.py
  install -m 0750 ../wodles/aws/services/aws_service.py ${installdir}/wodles/aws/services/aws_service.py
  install -m 0750 ../wodles/aws/services/cloudwatchlogs.py ${installdir}/wodles/aws/services/cloudwatchlogs.py
  install -m 0750 ../wodles/aws/services/__init__.py ${installdir}/wodles/aws/services/__init__.py
  install -m 0750 ../wodles/aws/services/inspector.py ${installdir}/wodles/aws/services/inspector.py
  install -m 0750 ../wodles/aws/subscribers/__init__.py ${installdir}/wodles/aws/subscribers/__init__.py
  install -m 0750 ../wodles/aws/subscribers/sqs_queue.py ${installdir}/wodles/aws/subscribers/sqs_queue.py
  install -m 0750 ../wodles/aws/subscribers/s3_log_handler.py ${installdir}/wodles/aws/subscribers/s3_log_handler.py
  install -m 0750 ../wodles/aws/subscribers/sqs_message_processor.py ${installdir}/wodles/aws/subscribers/sqs_message_processor.py
  install -d -m 0750 ${installdir}/wodles/gcloud
  install -d -m 0750 ${installdir}/wodles/gcloud/pubsub
  install -d -m 0750 ${installdir}/wodles/gcloud/buckets
  install -m 0750 ../wodles/gcloud/gcloud.py ${installdir}/wodles/gcloud/gcloud
  install -m 0750 ../wodles/gcloud/integration.py ${installdir}/wodles/gcloud/integration.py
  install -m 0750 ../wodles/gcloud/tools.py ${installdir}/wodles/gcloud/tools.py
  install -m 0750 ../wodles/gcloud/exceptions.py ${installdir}/wodles/gcloud/exceptions.py
  install -m 0750 ../wodles/gcloud/buckets/bucket.py ${installdir}/wodles/gcloud/buckets/bucket.py
  install -m 0750 ../wodles/gcloud/buckets/access_logs.py ${installdir}/wodles/gcloud/buckets/access_logs.py
  install -m 0750 ../wodles/gcloud/pubsub/subscriber.py ${installdir}/wodles/gcloud/pubsub/subscriber.py
  install -d -m 0750 ${installdir}/wodles/docker
  install -m 0750 ../wodles/docker-listener/DockerListener.py ${installdir}/wodles/docker/DockerListener
  install -d -m 0750 ${installdir}/wodles/azure
  install -d -m 0750 ${installdir}/wodles/azure/azure_services
  install -d -m 0750 ${installdir}/wodles/azure/db
  install -m 0750 ../wodles/azure/azure-logs.py ${installdir}/wodles/azure/azure-logs
  install -m 0750 ../wodles/azure/azure_utils.py ${installdir}/wodles/azure/azure_utils.py
  install -m 0750 ../wodles/azure/azure_services/__init__.py ${installdir}/wodles/azure/azure_services/__init__.py
  install -m 0750 ../wodles/azure/azure_services/analytics.py ${installdir}/wodles/azure/azure_services/analytics.py
  install -m 0750 ../wodles/azure/azure_services/graph.py ${installdir}/wodles/azure/azure_services/graph.py
  install -m 0750 ../wodles/azure/azure_services/storage.py ${installdir}/wodles/azure/azure_services/storage.py
  install -m 0750 ../wodles/azure/db/__init__.py ${installdir}/wodles/azure/db/__init__.py
  install -m 0750 ../wodles/azure/db/orm.py ${installdir}/wodles/azure/db/orm.py
  install -m 0750 ../wodles/azure/db/utils.py ${installdir}/wodles/azure/db/utils.py

  # Populate agent active-response directory
  install -d -m 0750 ${installdir}/active-response
  install -d -m 0750 ${installdir}/active-response/bin
  install -m 0750 active-response/*.sh ${installdir}/active-response/bin/
  install -m 0750 active-response/*.py ${installdir}/active-response/bin/
  # Mimic outcome of src/init/fw-check.sh
  install -m 0750 default-firewall-drop ${installdir}/active-response/bin/firewall-drop
  install -m 0750 default-firewall-drop ${installdir}/active-response/bin/
  install -m 0750 pf ${installdir}/active-response/bin/
  install -m 0750 npf ${installdir}/active-response/bin/
  install -m 0750 ipfw ${installdir}/active-response/bin/
  install -m 0750 firewalld-drop ${installdir}/active-response/bin/
  install -m 0750 disable-account ${installdir}/active-response/bin/
  install -m 0750 host-deny ${installdir}/active-response/bin/
  install -m 0750 ip-customblock ${installdir}/active-response/bin/
  install -m 0750 restart-wazuh ${installdir}/active-response/bin/
  install -m 0750 route-null ${installdir}/active-response/bin/
  install -m 0750 kaspersky ${installdir}/active-response/bin/
  install -m 0750 wazuh-slack ${installdir}/active-response/bin/

  # Populate agent agentless directory
  install -d -m 0750 ${installdir}/agentless
  install -m 0750 agentlessd/scripts/* ${installdir}/agentless/
  install -d -m 0770 ${installdir}/.ssh

  # Populate agent backup directory
  install -d -m 0750 ${installdir}/backup

  # Add the systemd service file
  install -Dm644 ./init/templates/wazuh-agent.service "${pkgdir}/usr/lib/systemd/system/wazuh-agent.service"
  sed -i 's/WAZUH_HOME_TMP/\/opt\/wazuh-agent/g' "${pkgdir}/usr/lib/systemd/system/wazuh-agent.service"

  # Add the license file
  install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/wazuh-agent/"
}
