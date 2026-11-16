# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=open-plc-utils
pkgver=r535.g46c35064
pkgrel=3
pkgdesc="Qualcomm Atheros Open Powerline Toolkit for HomePlug AV"
arch=(i686 x86_64)
url=https://github.com/qca/open-plc-utils
license=(custom:Clear_BSD)
makedepends=(git)
_commit=46c3506453c15b873fd6ed3e76c9872cea5e143a
source=("git+https://github.com/qca/open-plc-utils#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  echo r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make \
    ROOTFS="$pkgdir" \
    BIN="$pkgdir"/usr/bin \
    MAN="$pkgdir"/usr/share/man/man1 \
    install \
    manuals

  install -D -m 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # Install additional docs
  mkdir -p "$pkgdir"/usr/share/doc/$pkgname
  cp -av docbook "$pkgdir"/usr/share/doc/$pkgname/docbook

  # Avoid conflict with bluez-utils
  #mv "$pkgdir"/usr/bin/amptest{,.plc}

  # Avoid conflict with aur/pev
  #mv "$pkgdir"/usr/bin/pev{,.plc}

  # Remove setuid from all binaries
  #
  # Some of them can send or capture arbitrary Ether frames (edsu/edru,
  # ef[rsbe]u) and shouldn't be accessible to anyone but root by default.
  #
  # Other tools likely have untested ways to read/write arbitrary files, or
  # buffer overflow exploits, so in general they should not have setuid when
  # all they need is cap_net_raw.
  chmod -c u-s,g-s "$pkgdir"/usr/bin/*

  # Grant cap_net_raw to a few "Probably Fine" user-facing binaries
  # Don't grant it to binaries that can reboot/reset/reflash the hardware
  # (i.e. not bin/{int6k,amptool,plctool} nor bin/*boot)
  for file in "$pkgdir"/usr/bin/{amp,plc,int6k}{stat,wait}; do
    setcap cap_net_raw=ep "$file"
    echo "capabilities of '$file' added"
  done

  # Move some junk hardware-devel tools out of $PATH
  declare -A _keep=(
    # Main user tools
    ampstat     .
    int6kstat   .
    plcstat     .
    amptool     .
    int6k       .       # aka int6ktool
    plctool     .
    # Tonemap and other parameter dumping, somewhat interesting
    amprate     .
    int6krate   .
    plcrate     .
    amptone     .
    int6ktone   .     # I think this can tell you whether the wiring sucks
    plctone     .
    # QoS tools
    amprule     qos
    int6krule   qos
    plcrule     qos
    coqos_add   qos
    coqos_info  qos
    coqos_man   qos
    coqos_mod   qos
    coqos_rel   qos
    # Other parameter tweaking
    int6keth    .
    plcfwd      .
    # PIB fiddling
    # Technically usable by mortals
    ampID       pib
    int6kid     pib
    plcID       pib
    pibdump     pib
    pibrump     pib
    pib2xml     pib
    xml2pib     pib
    getpib      pib
    modpib      pib
    setpib      pib
    pibcomp     .
    pibruin     .
    # Additional scripting tools
    ampwait     .
    int6kwait   .
    plcwait     .
    amplist     .
    int6klist   .
    plclist     .
    plcdevs     .
    hpavkey     .
    hpavkeys    .
    # Arguably somewhat useful for scripting
    mac2pw      .
    mac2pwd     .
    nics        .
    rkey        .
    # Packet capture
    hpav        .
  )
  declare -A _junk=(
    # Firmware development (and probably unbricking) tools
    ampboot     dev
    amphost     dev
    int64host   dev
    int6kboot   dev
    int6kf      dev
    int6khost   dev
    plcboot     dev
    plchost     dev
    plchostd    dev
    plchostd2   dev
    config2cfg  dev
    sdram       dev
    amptest     dev
    int6ktest   dev
    plctest     dev
    plcotst     dev
    int6kmod    dev
    # Devel (binary log blobs)
    int6klog    dev
    plclog      dev     # the logs are in opaque binary format
    # Devel (MDIO twiddling)
    int6kmdio   dev
    int6kmdio2  dev
    plcmdio16   dev
    plcmdio32   dev
    mdioblock   dev
    mdioblock2  dev
    mdiodump    dev
    mdiogen     dev
    # Devel (management over serial port)
    int6kbaud   dev
    int6kdetect dev
    int6kuart   dev
    # Fuck knows??
    ptsctl      dev
    sada        dev
    weeder      dev
    # Raw Homeplug tools
    CMEncrypt   dev
    # EVSE (HomePlug Green PHY) tools
    evse        evse
    pev         evse
    # Raw Ethernet frame tools
    edru        ether
    edsu        ether
    efbu        ether
    efeu        ether
    efru        ether
    efsu        ether
    # Raw serial-port tools (might be generally useful)
    ttycat      .
    ttyrecv     .
    ttysend     .
    ttysig      .
    # PIB carrier/notch/tonemap/prescaler tweaking
    # Not very useful for most, but *technically* usable
    psgraph     .
    psnotch     .
    psin        .
    psout       .
    pskey       .
    # Interesting curiosities, but not useful enough to be in $BIN
    mme         .
  )
  mkdir -p "$pkgdir"/usr/lib/$pkgname
  for _bin in "$pkgdir"/usr/bin/*; do
    if [[ ${_keep[${_bin##*/}]} ]]; then
      continue
    elif [[ ${_junk[${_bin##*/}]} ]]; then
      mv -v -t "$pkgdir"/usr/lib/$pkgname/ "$_bin"
    else
      echo "undecided: $_bin"
    fi
  done
}

# vim: ts=2:sw=2:et:
