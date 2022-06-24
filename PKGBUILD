# Maintainer: Thaodan <theodorstormgrade@gmail.com>
# Submitter: Christos Nouskas <nous at archlinux dot us>
# PKGBUILD assembled from kernel26
# Some lines from  kernel26-bfs and kernel26-ck
# Credits to respective maintainers

##
### PATCH AND BUILD OPTIONS
#
# taken from graysky linux-ck see: https://aur.archlinux.org/packages/linux-ck
# Set these variables to ANYTHING (yes or no or 1 or 0 or "I like icecream") to enable them
#
_NUMA_off=yes		# Disable NUMA in kernel config


_BATCH_MODE=n # enable batch mode

### DOCS
# Starting with the 3.6.6-3 release, this package ships with the kernel-3x-gcc47-x.patch.
# This allows users an expanded scope of CPU specific options.
# Consult the following resources to understand which option is right for you application:
#
# http://en.gentoo-wiki.com/wiki/Safe_Cflags/Intel
# http://en.gentoo-wiki.com/wiki/Safe_Cflags/AMD
# http://www.linuxforge.net/docs/linux/linux-gcc.php
# http://gcc.gnu.org/onlinedocs/gcc/i386-and-x86_002d64-Options.html

# DETAILS FOR using 'make localmodconfig'
# As of mainline 2.6.32, running with this option will only build the modules that you currently have
# probed in your system VASTLY reducing the number of modules built and the build time to do it.
#
# WARNING - make CERTAIN that all modules are modprobed BEFORE you begin making the pkg!
#
# To keep track of which modules are needed for your specific system/hardware, give my module_db script
# a try: http://aur.archlinux.org/packages.php?ID=41689  Note that if you use my script, this PKGBUILD
# will auto run the 'sudo modprobed_db reload' for you to probe all the modules you have logged!
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed_db

# DETAILS FOR running kernel's config
# Enabling this option will use the .config of the RUNNING kernel rather than the ARCH defaults.
# Useful when the package gets updated and you already went through the trouble of customizing your
# config options.  NOT recommended when a new kernel is released, but again, convenient for package bumps.

# DRTAILS FOR _NUMA_off=yes
# Since 99.9% of users do not have multiple CPUs but do have multiple cores in one CPU
# see, https://bugs.archlinux.org/task/31187

# DETAILS FOR _BATCH_MODE
# enable batch mode to stop the pkgbuild from asking you what to do
# either by var or if $srcdir/batch_opts is found
# use defaults or options defined in batch_opts
# if $CPU is defined CONFIG_M${CPU,,} is enabled and CONFIG_GENERIC_CPU is disabled.
###

##

_major=5
_minor=18
#_patchlevel=0
#_subversion=1
_basekernel=${_major}.${_minor}
_srcname=linux-${_basekernel}
pkgbase=linux-pf
_unpatched_sublevel=6
_pfrel=2
_kernelname=pf
_pfpatchhome="https://github.com/pfactum/pf-kernel/compare"
_pfpatchname="v$_major.$_minor...v$_major.$_minor-pf$_pfrel.diff"
_projectcpatchname=prjc_v5.15-r1.patch
_CPUSUFFIXES_KBUILD=(
  # AMD
  K8 K8SSE3 K10 BARCELONA BOBCAT BULLDOZER PILEDRIVER STEAROLLER EXCAVATOR ZEN
  ZEN2 ZEN3
  # Intel
  CORE2 PSC
  ATOM PENTIUII PENTIUIII PENTIUM PENTIUM4 NEHALEM SANDYBRIDGE
  IVYBRIDGE HASWELL BROADWELL SILVERMONT SKYLAKE SKYLAKEX CANNONLAKE ICELAKE
  CASCADELAKE COOPERLAKE TIGERLAKE SAPPHIRERAPIDS ROCKETLAKE ALDERLAKE
  # Generic
  GENERIC_CPU2 GENERIC_CPU3 GENERIC_CPU4)
pkgname=('linux-pf')
pkgdesc="Linux with the pf-kernel patch (uksm, ZSTD, FSGSBASE and more)"
pkgname=('linux-pf' 'linux-pf-headers' 'linux-pf-preset-default')
pkgver=${_basekernel}.${_unpatched_sublevel}.${_kernelname}${_pfrel}
pkgrel=1
arch=('i686' 'x86_64')
url="https://gitlab.com/post-factum/pf-kernel/wikis/README"
license=('GPL2')
options=('!strip')
makedepends=('git' 'xmlto' 'docbook-xsl' 'xz' 'bc' 'kmod' 'elfutils' 'inetutils' 'pahole' 'cpio')
source=("https://www.kernel.org/pub/linux/kernel/v${_major}.x/linux-${_basekernel}.tar.xz"
	      'config.x86_64'
        'config.i686'
        'pf_defconfig'
        'linux.preset'			        # standard config files for mkinitcpio ramdisk
	      "${_pfpatchhome}/${_pfpatchname}"	# the -pf patchset
        # bmq-scheudler
        # "https://gitlab.com/alfredchen/projectc/raw/master/$_major.$_minor/$_projectcpatchname"
        "90-linux.hook"
        "60-linux.hook"
        # ZEN
        0002-ZEN-Add-VHBA-driver.patch
        0003-ZEN-Add-OpenRGB-patches.patch
        0006-ZEN-Disable-stack-conservation-for-GCC.patch
        0007-ZEN-Initialize-ata-before-graphics.patch
        0008-ZEN-Input-evdev-use-call_rcu-when-detaching-client.patch
        0010-ZEN-Add-CONFIG-to-rename-the-mq-deadline-scheduler.patch
        0011-ZEN-intel-pstate-Implement-enable-parameter.patch
        0012-ZEN-Add-ACS-override-support.patch
        0013-ZEN-PCI-Add-Intel-remapped-NVMe-device-support.patch
        0014-ZEN-futex-Add-entry-point-for-FUTEX_WAIT_MULTIPLE-op.patch
        0015-ZEN-mm-Disable-watermark-boosting-by-default.patch
        0016-ZEN-mm-Stop-kswapd-early-when-nothing-s-waiting-for-.patch
        0017-ZEN-mm-Increment-kswapd_waiters-for-throttled-direct.patch
        0018-ZEN-mm-Lower-the-non-hugetlbpage-pageblock-size-to-r.patch
        0019-ZEN-mm-Don-t-hog-the-CPU-and-zone-lock-in-rmqueue_bu.patch
        0020-ZEN-INTERACTIVE-Base-config-item.patch
        0021-ZEN-INTERACTIVE-Use-BFQ-as-our-elevator.patch
        0022-ZEN-INTERACTIVE-Enable-background-reclaim-of-hugepag.patch
        0023-ZEN-INTERACTIVE-Add-help-text-for-the-MG-LRU-tweaks.patch
        0024-ZEN-INTERACTIVE-Tune-CFS-for-interactivity.patch
        0025-ZEN-INTERACTIVE-Tune-ondemand-governor-for-interacti.patch
        0026-ZEN-INTERACTIVE-Document-PDS-BMQ-configuration.patch
        0027-ZEN-INTERACTIVE-mm-Disable-unevictable-compaction.patch
        0028-ZEN-INTERACTIVE-mm-Disable-proactive-compaction-by-d.patch
        0029-ZEN-HID-lenovo-Add-support-for-ThinkPad-TrackPoint-K.patch
        0030-ZEN-dm-crypt-Disable-workqueues-for-crypto-operation.patch
        # ZEN END
        # MGLRU
        0015-ZEN-Tune-mgLRU-to-protect-cache-used-in-the-last-sec.patch
        # MGLRU END
        # 5.18.6
        0001-Revert-drm-amd-display-Fix-DCN3-B0-DP-Alt-Mapping.patch
        0002-arm64-dts-imx8mm-beacon-Enable-RTS-CTS-on-UART3.patch
        0003-arm64-dts-imx8mn-beacon-Enable-RTS-CTS-on-UART3.patch
        0004-io_uring-reinstate-the-inflight-tracking.patch
        0005-powerpc-kasan-Silence-KASAN-warnings-in-__get_wchan.patch
        0006-ASoC-nau8822-Add-operation-for-internal-PLL-off-and-.patch
        0007-ASoC-qcom-lpass-platform-Update-VMA-access-permissio.patch
        0008-drm-amd-display-Read-Golden-Settings-Table-from-VBIO.patch
        0009-drm-amdgpu-Resolve-RAS-GFX-error-count-issue-after-c.patch
        0010-drm-amdkfd-Use-mmget_not_zero-in-MMU-notifier.patch
        0011-dma-debug-make-things-less-spammy-under-memory-press.patch
        0012-ASoC-Intel-cirrus-common-fix-incorrect-channel-mappi.patch
        0013-ASoC-cs42l52-Fix-TLV-scales-for-mixer-controls.patch
        0014-ASoC-cs35l36-Update-digital-volume-TLV.patch
        0015-ASoC-cs53l30-Correct-number-of-volume-levels-on-SX-c.patch
        0016-ASoC-cs42l52-Correct-TLV-for-Bypass-Volume.patch
        0017-ASoC-cs42l56-Correct-typo-in-minimum-level-for-SX-vo.patch
        0018-ASoC-cs42l51-Correct-minimum-value-for-SX-volume-con.patch
        0019-drm-amdkfd-add-pinned-BOs-to-kfd_bo_list.patch
        0020-ata-libata-core-fix-NULL-pointer-deref-in-ata_host_a.patch
        0021-quota-Prevent-memory-allocation-recursion-while-hold.patch
        0022-ASoC-wm8962-Fix-suspend-while-playing-music.patch
        0023-ASoC-es8328-Fix-event-generation-for-deemphasis-cont.patch
        0024-ASoC-wm_adsp-Fix-event-generation-for-wm_adsp_fw_put.patch
        0025-ALSA-hda-MTL-add-HD-Audio-PCI-ID-and-HDMI-codec-vend.patch
        0026-Input-soc_button_array-also-add-Lenovo-Yoga-Tablet2-.patch
        0027-scsi-vmw_pvscsi-Expand-vcpuHint-to-16-bits.patch
        0028-scsi-lpfc-Resolve-NULL-ptr-dereference-after-an-ELS-.patch
        0029-scsi-lpfc-Fix-port-stuck-in-bypassed-state-after-LIP.patch
        0030-scsi-lpfc-Allow-reduced-polling-rate-for-nvme_admin_.patch
        0031-scsi-mpt3sas-Fix-out-of-bounds-compiler-warning.patch
        0032-scsi-ipr-Fix-missing-incorrect-resource-cleanup-in-e.patch
        0033-scsi-pmcraid-Fix-missing-resource-cleanup-in-error-c.patch
        0034-ALSA-hda-realtek-Add-HW8326-support.patch
        0035-virtio-mmio-fix-missing-put_device-when-vm_cmdline_p.patch
        0036-nfc-nfcmrvl-Fix-memory-leak-in-nfcmrvl_play_deferred.patch
        0037-ipv6-Fix-signed-integer-overflow-in-__ip6_append_dat.patch
        0038-ipv6-Fix-signed-integer-overflow-in-l2tp_ip6_sendmsg.patch
        0039-net-ethernet-mtk_eth_soc-fix-misuse-of-mem-alloc-int.patch
        0040-gcc-12-disable-Wdangling-pointer-warning-for-now.patch
        0041-mellanox-mlx5-avoid-uninitialized-variable-warning-w.patch
        0042-gcc-12-disable-Warray-bounds-universally-for-now.patch
        0043-netfs-gcc-12-temporarily-disable-Wattribute-warning-.patch
        0044-MIPS-Loongson-3-fix-compile-mips-cpu_hwmon-as-module.patch
        0045-random-credit-cpu-and-bootloader-seeds-by-default.patch
        0046-gpio-dwapb-Don-t-print-error-on-EPROBE_DEFER.patch
        0047-platform-x86-intel-Fix-pmt_crashlog-array-reference.patch
        0048-platform-x86-intel-pmc-Support-Intel-Raptorlake-P.patch
        0049-platform-x86-gigabyte-wmi-Add-Z690M-AORUS-ELITE-AX-D.patch
        0050-platform-x86-gigabyte-wmi-Add-support-for-B450M-DS3H.patch
        0051-platform-x86-intel-hid-Add-Surface-Go-to-VGBS-allow-.patch
        0052-staging-r8188eu-fix-rtw_alloc_hwxmits-error-detectio.patch
        0053-staging-r8188eu-Fix-warning-of-array-overflow-in-ioc.patch
        0054-pNFS-Don-t-keep-retrying-if-the-server-replied-NFS4E.patch
        0055-pNFS-Avoid-a-live-lock-condition-in-pnfs_update_layo.patch
        0056-sunrpc-set-cl_max_connect-when-cloning-an-rpc_clnt.patch
        0057-clocksource-hyper-v-unexport-__init-annotated-hv_ini.patch
        0058-i40e-Fix-adding-ADQ-filter-to-TC0.patch
        0059-i40e-Fix-calculating-the-number-of-queue-pairs.patch
        0060-i40e-Fix-call-trace-in-setup_tx_descriptors.patch
        0061-iavf-Fix-issue-with-MAC-address-of-VF-shown-as-zero.patch
        0062-Drivers-hv-vmbus-Release-cpu-lock-in-error-case.patch
        0063-tty-goldfish-Fix-free_irq-on-remove.patch
        0064-misc-atmel-ssc-Fix-IRQ-check-in-ssc_probe.patch
        0065-riscv-dts-microchip-re-add-pdma-to-mpfs-device-tree.patch
        0066-io_uring-fix-races-with-file-table-unregister.patch
        0067-io_uring-fix-races-with-buffer-table-unregister.patch
        0068-drm-i915-reset-Fix-error_state_read-ptr-offset-use.patch
        0069-net-hns3-set-port-base-vlan-tbl_sta-to-false-before-.patch
        0070-net-hns3-don-t-push-link-state-to-VF-if-unalive.patch
        0071-net-hns3-restore-tm-priority-qset-to-default-setting.patch
        0072-net-hns3-fix-PF-rss-size-initialization-bug.patch
        0073-net-hns3-fix-tm-port-shapping-of-fibre-port-is-incor.patch
        0074-nvme-add-device-name-to-warning-in-uuid_show.patch
        0075-mlxsw-spectrum_cnt-Reorder-counter-pools.patch
        0076-ice-Fix-PTP-TX-timestamp-offset-calculation.patch
        0077-ice-Sync-VLAN-filtering-features-for-DVM.patch
        0078-ice-Fix-queue-config-fail-handling.patch
        0079-ice-Fix-memory-corruption-in-VF-driver.patch
        0080-net-bgmac-Fix-an-erroneous-kfree-in-bgmac_remove.patch
        0081-net-remove-noblock-parameter-from-skb_recv_datagram.patch
        0082-net-ax25-Fix-deadlock-caused-by-skb_recv_datagram-in.patch
        0083-arm64-ftrace-fix-branch-range-checks.patch
        0084-arm64-ftrace-consistently-handle-PLTs.patch
        0085-certs-blacklist_hashes.c-fix-const-confusion-in-cert.patch
        0086-init-Initialize-noop_backing_dev_info-early.patch
        0087-block-Fix-handling-of-offline-queues-in-blk_mq_alloc.patch
        0088-faddr2line-Fix-overlapping-text-section-failures-the.patch
        0089-x86-ftrace-Remove-OBJECT_FILES_NON_STANDARD-usage.patch
        0090-i2c-npcm7xx-Add-check-for-platform_driver_register.patch
        0091-irqchip-gic-realview-Fix-refcount-leak-in-realview_g.patch
        0092-irqchip-apple-aic-Fix-refcount-leak-in-build_fiq_aff.patch
        0093-irqchip-apple-aic-Fix-refcount-leak-in-aic_of_ic_ini.patch
        0094-irqchip-gic-v3-Fix-error-handling-in-gic_populate_pp.patch
        0095-irqchip-gic-v3-Fix-refcount-leak-in-gic_populate_ppi.patch
        0096-irqchip-realtek-rtl-Fix-refcount-leak-in-map_interru.patch
        0097-sched-Fix-balance_push-vs-__sched_setscheduler.patch
        0098-i2c-designware-Use-standard-optional-ref-clock-imple.patch
        0099-i2c-mediatek-Fix-an-error-handling-path-in-mtk_i2c_p.patch
        0100-mei-hbm-drop-capability-response-on-early-shutdown.patch
        0101-mei-me-add-raptor-lake-point-S-DID.patch
        0102-comedi-vmk80xx-fix-expression-for-tx-buffer-size.patch
        0103-crypto-memneq-move-into-lib.patch
        0104-USB-serial-option-add-support-for-Cinterion-MV31-wit.patch
        0105-USB-serial-io_ti-add-Agilent-E5805A-support.patch
        0106-arm64-mm-Don-t-invalidate-FROM_DEVICE-buffers-at-sta.patch
        0107-usb-dwc2-Fix-memory-leak-in-dwc2_hcd_init.patch
        0108-usb-cdnsp-Fixed-setting-last_trb-incorrectly.patch
        0109-usb-dwc3-gadget-Fix-IN-endpoint-max-packet-size-allo.patch
        0110-usb-dwc3-pci-Restore-line-lost-in-merge-conflict-res.patch
        0111-usb-gadget-u_ether-fix-regression-in-setting-fixed-M.patch
        0112-usb-gadget-lpc32xx_udc-Fix-refcount-leak-in-lpc32xx_.patch
        0113-usb-gadget-f_fs-change-ep-status-safe-in-ffs_epfile_.patch
        0114-usb-gadget-f_fs-change-ep-ep-safe-in-ffs_epfile_io.patch
        0115-tty-n_gsm-Debug-output-allocation-must-use-GFP_ATOMI.patch
        0116-serial-8250-Store-to-lsr_save_flags-after-lsr-read.patch
        0117-bus-fsl-mc-bus-fix-KASAN-use-after-free-in-fsl_mc_bu.patch
        0118-md-raid5-ppl-Fix-argument-order-in-bio_alloc_bioset.patch
        0119-dm-fix-race-in-dm_start_io_acct.patch
        0120-dm-mirror-log-round-up-region-bitmap-size-to-BITS_PE.patch
        0121-drm-amdgpu-Fix-GTT-size-reporting-in-amdgpu_ioctl.patch
        0122-drm-amd-display-Cap-OLED-brightness-per-max-frame-av.patch
        0123-audit-free-module-name.patch
        0124-cfi-Fix-__cfi_slowpath_diag-RCU-usage-with-cpuidle.patch
        0125-fs-account-for-group-membership.patch
        0126-selinux-free-contexts-previously-transferred-in-seli.patch
        0127-ext4-fix-super-block-checksum-incorrect-after-mount.patch
        0128-ext4-fix-bug_on-ext4_mb_use_inode_pa.patch
        0129-ext4-make-variable-count-signed.patch
        0130-ext4-add-reserved-GDT-blocks-check.patch
        0131-KVM-arm64-Always-start-with-clearing-SVE-flag-on-loa.patch
        0132-KVM-arm64-Don-t-read-a-HW-interrupt-pending-state-in.patch
        0133-virtio-pci-Remove-wrong-address-verification-in-vp_d.patch
        0134-netfs-Fix-gcc-12-warning-by-embedding-vfs-inode-in-n.patch
        0135-drm-i915-uc-remove-accidental-static-from-a-local-va.patch
        0136-bpf-Use-safer-kvmalloc_array-where-possible.patch
        0137-powerpc-book3e-get-rid-of-include-generated-compile..patch
        0138-dt-bindings-mfd-bd9571mwv-update-rohm-bd9571mwv.yaml.patch
        0139-dt-bindings-interrupt-controller-update-brcm-l2-intc.patch
        0140-dm-fix-bio_set-allocation.patch
        0141-clk-imx8mp-fix-usb_root_clk-parent.patch
        # 5.18.6 END
        # https://bugzilla.kernel.org/show_bug.cgi?id=211005
        'asus_zenith_ii_map.patch::https://bugzilla.kernel.org/attachment.cgi?id=294489'
       )
# 	'cx23885_move_CI_AC_registration_to_a_separate_function.patch'



prepare() {
  cd "${srcdir}/linux-${_basekernel}"
  msg "Applying pf-kernel patch"
  patch -Np1 < ${srcdir}/${_pfpatchname}

  patch -p1 -i ${srcdir}/0002-ZEN-Add-VHBA-driver.patch
  patch -p1 -i ${srcdir}/0003-ZEN-Add-OpenRGB-patches.patch
  # already applied by pf
  # patch -p1 -i ${srcdir}/0004-ZEN-Add-graysky-s-more-uarches.patch
  # already applied by pf
  # patch -p1 -i ${srcdir}/0005-ZEN-Unrestrict-CONFIG_OPTIMIZE_FOR_PERFORMANCE_O3.patch
  patch -p1 -i ${srcdir}/0006-ZEN-Disable-stack-conservation-for-GCC.patch
  patch -p1 -i ${srcdir}/0007-ZEN-Initialize-ata-before-graphics.patch
  patch -p1 -i ${srcdir}/0008-ZEN-Input-evdev-use-call_rcu-when-detaching-client.patch
  # already applied by pf
  # 0009-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
  patch -p1 -i ${srcdir}/0010-ZEN-Add-CONFIG-to-rename-the-mq-deadline-scheduler.patch
  patch -p1 -i ${srcdir}/0011-ZEN-intel-pstate-Implement-enable-parameter.patch
  patch -p1 -i ${srcdir}/0012-ZEN-Add-ACS-override-support.patch
  patch -p1 -i ${srcdir}/0013-ZEN-PCI-Add-Intel-remapped-NVMe-device-support.patch
  patch -p1 -i ${srcdir}/0014-ZEN-futex-Add-entry-point-for-FUTEX_WAIT_MULTIPLE-op.patch
  patch -p1 -i ${srcdir}/0015-ZEN-mm-Disable-watermark-boosting-by-default.patch
  patch -p1 -i ${srcdir}/0016-ZEN-mm-Stop-kswapd-early-when-nothing-s-waiting-for-.patch
  patch -p1 -i ${srcdir}/0017-ZEN-mm-Increment-kswapd_waiters-for-throttled-direct.patch
  patch -p1 -i ${srcdir}/0018-ZEN-mm-Lower-the-non-hugetlbpage-pageblock-size-to-r.patch
  patch -p1 -i ${srcdir}/0019-ZEN-mm-Don-t-hog-the-CPU-and-zone-lock-in-rmqueue_bu.patch
  patch -p1 -i ${srcdir}/0020-ZEN-INTERACTIVE-Base-config-item.patch
  patch -p1 -i ${srcdir}/0021-ZEN-INTERACTIVE-Use-BFQ-as-our-elevator.patch
  patch -p1 -i ${srcdir}/0022-ZEN-INTERACTIVE-Enable-background-reclaim-of-hugepag.patch
  patch -p1 -i ${srcdir}/0023-ZEN-INTERACTIVE-Add-help-text-for-the-MG-LRU-tweaks.patch
  patch -p1 -i ${srcdir}/0024-ZEN-INTERACTIVE-Tune-CFS-for-interactivity.patch
  patch -p1 -i ${srcdir}/0025-ZEN-INTERACTIVE-Tune-ondemand-governor-for-interacti.patch
  patch -p1 -i ${srcdir}/0026-ZEN-INTERACTIVE-Document-PDS-BMQ-configuration.patch
  patch -p1 -i ${srcdir}/0027-ZEN-INTERACTIVE-mm-Disable-unevictable-compaction.patch
  patch -p1 -i ${srcdir}/0028-ZEN-INTERACTIVE-mm-Disable-proactive-compaction-by-d.patch
  patch -p1 -i ${srcdir}/0029-ZEN-HID-lenovo-Add-support-for-ThinkPad-TrackPoint-K.patch
  patch -p1 -i ${srcdir}/0030-ZEN-dm-crypt-Disable-workqueues-for-crypto-operation.patch

  # MLGRU
  patch -p1 -i ${srcdir}/0015-ZEN-Tune-mgLRU-to-protect-cache-used-in-the-last-sec.patch

  # 5.18.6
  patch -p1 -i ${srcdir}/0001-Revert-drm-amd-display-Fix-DCN3-B0-DP-Alt-Mapping.patch
  patch -p1 -i ${srcdir}/0002-arm64-dts-imx8mm-beacon-Enable-RTS-CTS-on-UART3.patch
  patch -p1 -i ${srcdir}/0003-arm64-dts-imx8mn-beacon-Enable-RTS-CTS-on-UART3.patch
  patch -p1 -i ${srcdir}/0004-io_uring-reinstate-the-inflight-tracking.patch
  patch -p1 -i ${srcdir}/0005-powerpc-kasan-Silence-KASAN-warnings-in-__get_wchan.patch
  patch -p1 -i ${srcdir}/0006-ASoC-nau8822-Add-operation-for-internal-PLL-off-and-.patch
  patch -p1 -i ${srcdir}/0007-ASoC-qcom-lpass-platform-Update-VMA-access-permissio.patch
  patch -p1 -i ${srcdir}/0008-drm-amd-display-Read-Golden-Settings-Table-from-VBIO.patch
  patch -p1 -i ${srcdir}/0009-drm-amdgpu-Resolve-RAS-GFX-error-count-issue-after-c.patch
  patch -p1 -i ${srcdir}/0010-drm-amdkfd-Use-mmget_not_zero-in-MMU-notifier.patch
  patch -p1 -i ${srcdir}/0011-dma-debug-make-things-less-spammy-under-memory-press.patch
  patch -p1 -i ${srcdir}/0012-ASoC-Intel-cirrus-common-fix-incorrect-channel-mappi.patch
  patch -p1 -i ${srcdir}/0013-ASoC-cs42l52-Fix-TLV-scales-for-mixer-controls.patch
  patch -p1 -i ${srcdir}/0014-ASoC-cs35l36-Update-digital-volume-TLV.patch
  patch -p1 -i ${srcdir}/0015-ASoC-cs53l30-Correct-number-of-volume-levels-on-SX-c.patch
  patch -p1 -i ${srcdir}/0016-ASoC-cs42l52-Correct-TLV-for-Bypass-Volume.patch
  patch -p1 -i ${srcdir}/0017-ASoC-cs42l56-Correct-typo-in-minimum-level-for-SX-vo.patch
  patch -p1 -i ${srcdir}/0018-ASoC-cs42l51-Correct-minimum-value-for-SX-volume-con.patch
  patch -p1 -i ${srcdir}/0019-drm-amdkfd-add-pinned-BOs-to-kfd_bo_list.patch
  patch -p1 -i ${srcdir}/0020-ata-libata-core-fix-NULL-pointer-deref-in-ata_host_a.patch
  patch -p1 -i ${srcdir}/0021-quota-Prevent-memory-allocation-recursion-while-hold.patch
  patch -p1 -i ${srcdir}/0022-ASoC-wm8962-Fix-suspend-while-playing-music.patch
  patch -p1 -i ${srcdir}/0023-ASoC-es8328-Fix-event-generation-for-deemphasis-cont.patch
  patch -p1 -i ${srcdir}/0024-ASoC-wm_adsp-Fix-event-generation-for-wm_adsp_fw_put.patch
  patch -p1 -i ${srcdir}/0025-ALSA-hda-MTL-add-HD-Audio-PCI-ID-and-HDMI-codec-vend.patch
  patch -p1 -i ${srcdir}/0026-Input-soc_button_array-also-add-Lenovo-Yoga-Tablet2-.patch
  patch -p1 -i ${srcdir}/0027-scsi-vmw_pvscsi-Expand-vcpuHint-to-16-bits.patch
  patch -p1 -i ${srcdir}/0028-scsi-lpfc-Resolve-NULL-ptr-dereference-after-an-ELS-.patch
  patch -p1 -i ${srcdir}/0029-scsi-lpfc-Fix-port-stuck-in-bypassed-state-after-LIP.patch
  patch -p1 -i ${srcdir}/0030-scsi-lpfc-Allow-reduced-polling-rate-for-nvme_admin_.patch
  patch -p1 -i ${srcdir}/0031-scsi-mpt3sas-Fix-out-of-bounds-compiler-warning.patch
  patch -p1 -i ${srcdir}/0032-scsi-ipr-Fix-missing-incorrect-resource-cleanup-in-e.patch
  patch -p1 -i ${srcdir}/0033-scsi-pmcraid-Fix-missing-resource-cleanup-in-error-c.patch
  patch -p1 -i ${srcdir}/0034-ALSA-hda-realtek-Add-HW8326-support.patch
  patch -p1 -i ${srcdir}/0035-virtio-mmio-fix-missing-put_device-when-vm_cmdline_p.patch
  patch -p1 -i ${srcdir}/0036-nfc-nfcmrvl-Fix-memory-leak-in-nfcmrvl_play_deferred.patch
  patch -p1 -i ${srcdir}/0037-ipv6-Fix-signed-integer-overflow-in-__ip6_append_dat.patch
  patch -p1 -i ${srcdir}/0038-ipv6-Fix-signed-integer-overflow-in-l2tp_ip6_sendmsg.patch
  patch -p1 -i ${srcdir}/0039-net-ethernet-mtk_eth_soc-fix-misuse-of-mem-alloc-int.patch
  patch -p1 -i ${srcdir}/0040-gcc-12-disable-Wdangling-pointer-warning-for-now.patch
  patch -p1 -i ${srcdir}/0041-mellanox-mlx5-avoid-uninitialized-variable-warning-w.patch
  patch -p1 -i ${srcdir}/0042-gcc-12-disable-Warray-bounds-universally-for-now.patch
  patch -p1 -i ${srcdir}/0043-netfs-gcc-12-temporarily-disable-Wattribute-warning-.patch
  patch -p1 -i ${srcdir}/0044-MIPS-Loongson-3-fix-compile-mips-cpu_hwmon-as-module.patch
  patch -p1 -i ${srcdir}/0045-random-credit-cpu-and-bootloader-seeds-by-default.patch
  patch -p1 -i ${srcdir}/0046-gpio-dwapb-Don-t-print-error-on-EPROBE_DEFER.patch
  patch -p1 -i ${srcdir}/0047-platform-x86-intel-Fix-pmt_crashlog-array-reference.patch
  patch -p1 -i ${srcdir}/0048-platform-x86-intel-pmc-Support-Intel-Raptorlake-P.patch
  patch -p1 -i ${srcdir}/0049-platform-x86-gigabyte-wmi-Add-Z690M-AORUS-ELITE-AX-D.patch
  patch -p1 -i ${srcdir}/0050-platform-x86-gigabyte-wmi-Add-support-for-B450M-DS3H.patch
  patch -p1 -i ${srcdir}/0051-platform-x86-intel-hid-Add-Surface-Go-to-VGBS-allow-.patch
  patch -p1 -i ${srcdir}/0052-staging-r8188eu-fix-rtw_alloc_hwxmits-error-detectio.patch
  patch -p1 -i ${srcdir}/0053-staging-r8188eu-Fix-warning-of-array-overflow-in-ioc.patch
  patch -p1 -i ${srcdir}/0054-pNFS-Don-t-keep-retrying-if-the-server-replied-NFS4E.patch
  patch -p1 -i ${srcdir}/0055-pNFS-Avoid-a-live-lock-condition-in-pnfs_update_layo.patch
  patch -p1 -i ${srcdir}/0056-sunrpc-set-cl_max_connect-when-cloning-an-rpc_clnt.patch
  patch -p1 -i ${srcdir}/0057-clocksource-hyper-v-unexport-__init-annotated-hv_ini.patch
  patch -p1 -i ${srcdir}/0058-i40e-Fix-adding-ADQ-filter-to-TC0.patch
  patch -p1 -i ${srcdir}/0059-i40e-Fix-calculating-the-number-of-queue-pairs.patch
  patch -p1 -i ${srcdir}/0060-i40e-Fix-call-trace-in-setup_tx_descriptors.patch
  patch -p1 -i ${srcdir}/0061-iavf-Fix-issue-with-MAC-address-of-VF-shown-as-zero.patch
  patch -p1 -i ${srcdir}/0062-Drivers-hv-vmbus-Release-cpu-lock-in-error-case.patch
  patch -p1 -i ${srcdir}/0063-tty-goldfish-Fix-free_irq-on-remove.patch
  patch -p1 -i ${srcdir}/0064-misc-atmel-ssc-Fix-IRQ-check-in-ssc_probe.patch
  patch -p1 -i ${srcdir}/0065-riscv-dts-microchip-re-add-pdma-to-mpfs-device-tree.patch
  patch -p1 -i ${srcdir}/0066-io_uring-fix-races-with-file-table-unregister.patch
  patch -p1 -i ${srcdir}/0067-io_uring-fix-races-with-buffer-table-unregister.patch
  patch -p1 -i ${srcdir}/0068-drm-i915-reset-Fix-error_state_read-ptr-offset-use.patch
  patch -p1 -i ${srcdir}/0069-net-hns3-set-port-base-vlan-tbl_sta-to-false-before-.patch
  patch -p1 -i ${srcdir}/0070-net-hns3-don-t-push-link-state-to-VF-if-unalive.patch
  patch -p1 -i ${srcdir}/0071-net-hns3-restore-tm-priority-qset-to-default-setting.patch
  patch -p1 -i ${srcdir}/0072-net-hns3-fix-PF-rss-size-initialization-bug.patch
  patch -p1 -i ${srcdir}/0073-net-hns3-fix-tm-port-shapping-of-fibre-port-is-incor.patch
  patch -p1 -i ${srcdir}/0074-nvme-add-device-name-to-warning-in-uuid_show.patch
  patch -p1 -i ${srcdir}/0075-mlxsw-spectrum_cnt-Reorder-counter-pools.patch
  patch -p1 -i ${srcdir}/0076-ice-Fix-PTP-TX-timestamp-offset-calculation.patch
  patch -p1 -i ${srcdir}/0077-ice-Sync-VLAN-filtering-features-for-DVM.patch
  patch -p1 -i ${srcdir}/0078-ice-Fix-queue-config-fail-handling.patch
  patch -p1 -i ${srcdir}/0079-ice-Fix-memory-corruption-in-VF-driver.patch
  patch -p1 -i ${srcdir}/0080-net-bgmac-Fix-an-erroneous-kfree-in-bgmac_remove.patch
  patch -p1 -i ${srcdir}/0081-net-remove-noblock-parameter-from-skb_recv_datagram.patch
  patch -p1 -i ${srcdir}/0082-net-ax25-Fix-deadlock-caused-by-skb_recv_datagram-in.patch
  patch -p1 -i ${srcdir}/0083-arm64-ftrace-fix-branch-range-checks.patch
  patch -p1 -i ${srcdir}/0084-arm64-ftrace-consistently-handle-PLTs.patch
  patch -p1 -i ${srcdir}/0085-certs-blacklist_hashes.c-fix-const-confusion-in-cert.patch
  patch -p1 -i ${srcdir}/0086-init-Initialize-noop_backing_dev_info-early.patch
  patch -p1 -i ${srcdir}/0087-block-Fix-handling-of-offline-queues-in-blk_mq_alloc.patch
  patch -p1 -i ${srcdir}/0088-faddr2line-Fix-overlapping-text-section-failures-the.patch
  patch -p1 -i ${srcdir}/0089-x86-ftrace-Remove-OBJECT_FILES_NON_STANDARD-usage.patch
  patch -p1 -i ${srcdir}/0090-i2c-npcm7xx-Add-check-for-platform_driver_register.patch
  patch -p1 -i ${srcdir}/0091-irqchip-gic-realview-Fix-refcount-leak-in-realview_g.patch
  patch -p1 -i ${srcdir}/0092-irqchip-apple-aic-Fix-refcount-leak-in-build_fiq_aff.patch
  patch -p1 -i ${srcdir}/0093-irqchip-apple-aic-Fix-refcount-leak-in-aic_of_ic_ini.patch
  patch -p1 -i ${srcdir}/0094-irqchip-gic-v3-Fix-error-handling-in-gic_populate_pp.patch
  patch -p1 -i ${srcdir}/0095-irqchip-gic-v3-Fix-refcount-leak-in-gic_populate_ppi.patch
  patch -p1 -i ${srcdir}/0096-irqchip-realtek-rtl-Fix-refcount-leak-in-map_interru.patch
  patch -p1 -i ${srcdir}/0097-sched-Fix-balance_push-vs-__sched_setscheduler.patch
  patch -p1 -i ${srcdir}/0098-i2c-designware-Use-standard-optional-ref-clock-imple.patch
  patch -p1 -i ${srcdir}/0099-i2c-mediatek-Fix-an-error-handling-path-in-mtk_i2c_p.patch
  patch -p1 -i ${srcdir}/0100-mei-hbm-drop-capability-response-on-early-shutdown.patch
  patch -p1 -i ${srcdir}/0101-mei-me-add-raptor-lake-point-S-DID.patch
  patch -p1 -i ${srcdir}/0102-comedi-vmk80xx-fix-expression-for-tx-buffer-size.patch
  patch -p1 -i ${srcdir}/0103-crypto-memneq-move-into-lib.patch
  patch -p1 -i ${srcdir}/0104-USB-serial-option-add-support-for-Cinterion-MV31-wit.patch
  patch -p1 -i ${srcdir}/0105-USB-serial-io_ti-add-Agilent-E5805A-support.patch
  patch -p1 -i ${srcdir}/0106-arm64-mm-Don-t-invalidate-FROM_DEVICE-buffers-at-sta.patch
  patch -p1 -i ${srcdir}/0107-usb-dwc2-Fix-memory-leak-in-dwc2_hcd_init.patch
  patch -p1 -i ${srcdir}/0108-usb-cdnsp-Fixed-setting-last_trb-incorrectly.patch
  patch -p1 -i ${srcdir}/0109-usb-dwc3-gadget-Fix-IN-endpoint-max-packet-size-allo.patch
  patch -p1 -i ${srcdir}/0110-usb-dwc3-pci-Restore-line-lost-in-merge-conflict-res.patch
  patch -p1 -i ${srcdir}/0111-usb-gadget-u_ether-fix-regression-in-setting-fixed-M.patch
  patch -p1 -i ${srcdir}/0112-usb-gadget-lpc32xx_udc-Fix-refcount-leak-in-lpc32xx_.patch
  patch -p1 -i ${srcdir}/0113-usb-gadget-f_fs-change-ep-status-safe-in-ffs_epfile_.patch
  patch -p1 -i ${srcdir}/0114-usb-gadget-f_fs-change-ep-ep-safe-in-ffs_epfile_io.patch
  patch -p1 -i ${srcdir}/0115-tty-n_gsm-Debug-output-allocation-must-use-GFP_ATOMI.patch
  patch -p1 -i ${srcdir}/0116-serial-8250-Store-to-lsr_save_flags-after-lsr-read.patch
  patch -p1 -i ${srcdir}/0117-bus-fsl-mc-bus-fix-KASAN-use-after-free-in-fsl_mc_bu.patch
  patch -p1 -i ${srcdir}/0118-md-raid5-ppl-Fix-argument-order-in-bio_alloc_bioset.patch
  patch -p1 -i ${srcdir}/0119-dm-fix-race-in-dm_start_io_acct.patch
  patch -p1 -i ${srcdir}/0120-dm-mirror-log-round-up-region-bitmap-size-to-BITS_PE.patch
  patch -p1 -i ${srcdir}/0121-drm-amdgpu-Fix-GTT-size-reporting-in-amdgpu_ioctl.patch
  patch -p1 -i ${srcdir}/0122-drm-amd-display-Cap-OLED-brightness-per-max-frame-av.patch
  patch -p1 -i ${srcdir}/0123-audit-free-module-name.patch
  patch -p1 -i ${srcdir}/0124-cfi-Fix-__cfi_slowpath_diag-RCU-usage-with-cpuidle.patch
  patch -p1 -i ${srcdir}/0125-fs-account-for-group-membership.patch
  patch -p1 -i ${srcdir}/0126-selinux-free-contexts-previously-transferred-in-seli.patch
  patch -p1 -i ${srcdir}/0127-ext4-fix-super-block-checksum-incorrect-after-mount.patch
  patch -p1 -i ${srcdir}/0128-ext4-fix-bug_on-ext4_mb_use_inode_pa.patch
  patch -p1 -i ${srcdir}/0129-ext4-make-variable-count-signed.patch
  patch -p1 -i ${srcdir}/0130-ext4-add-reserved-GDT-blocks-check.patch
  patch -p1 -i ${srcdir}/0131-KVM-arm64-Always-start-with-clearing-SVE-flag-on-loa.patch
  patch -p1 -i ${srcdir}/0132-KVM-arm64-Don-t-read-a-HW-interrupt-pending-state-in.patch
  patch -p1 -i ${srcdir}/0133-virtio-pci-Remove-wrong-address-verification-in-vp_d.patch
  patch -p1 -i ${srcdir}/0134-netfs-Fix-gcc-12-warning-by-embedding-vfs-inode-in-n.patch
  patch -p1 -i ${srcdir}/0135-drm-i915-uc-remove-accidental-static-from-a-local-va.patch
  patch -p1 -i ${srcdir}/0136-bpf-Use-safer-kvmalloc_array-where-possible.patch
  patch -p1 -i ${srcdir}/0137-powerpc-book3e-get-rid-of-include-generated-compile..patch
  patch -p1 -i ${srcdir}/0138-dt-bindings-mfd-bd9571mwv-update-rohm-bd9571mwv.yaml.patch
  patch -p1 -i ${srcdir}/0139-dt-bindings-interrupt-controller-update-brcm-l2-intc.patch
  patch -p1 -i ${srcdir}/0140-dm-fix-bio_set-allocation.patch
  patch -p1 -i ${srcdir}/0141-clk-imx8mp-fix-usb_root_clk-parent.patch


  # Add port map for ASUS Zenith II
  patch -p1 -i ${srcdir}/asus_zenith_ii_map.patch

  if [ "$CARCH" = "x86_64" ]; then
	  cat "${startdir}/config.x86_64" >| .config
  else
	  cat "${startdir}/config.i686" >| .config
  fi

  # Restore unpatched sublevel the current -pf is based on
  sed -ri "s|SUBLEVEL = 0|SUBLEVEL = $_unpatched_sublevel|" Makefile

  _arch=$CARCH


  # disable NUMA since 99.9% of users do not have multiple CPUs but do have multiple cores in one CPU
  # see, https://bugs.archlinux.org/task/31187
  if [ -n "$_NUMA_off" ] && [ "${CARCH}" = "x86_64" ]; then
    sed -i -e 's/CONFIG_NUMA=y/# CONFIG_NUMA is not set/' \
        -i -e '/CONFIG_AMD_NUMA=y/d' \
        -i -e '/CONFIG_X86_64_ACPI_NUMA=y/d' \
        -i -e '/CONFIG_NODES_SPAN_OTHER_NODES=y/d' \
        -i -e '/# CONFIG_NUMA_EMU is not set/d' \
        -i -e '/CONFIG_NODES_SHIFT=6/d' \
        -i -e '/CONFIG_NEED_MULTIPLE_NODES=y/d' \
        -i -e '/CONFIG_USE_PERCPU_NUMA_NODE_ID=y/d' \
        -i -e '/CONFIG_ACPI_NUMA=y/d' ./.config
  fi

  # If the following is set, stop right there. We only need the headers for
  # dependent drivers' compiling (nvidia, virtualbox etc)

  # merge our changes to arches kernel config
  ./scripts/kconfig/merge_config.sh .config "$srcdir"/pf_defconfig

  # Set localversion to pkgrel
  echo "-$pkgrel" > localversion.10-pkgrel

  # get kernel version
  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd "${srcdir}/linux-${_basekernel}"

  # enable $_BATCH_MODE if batch_opts is found in $srcdir
  if [[ -e $srcdir/batch_opts ]] ; then
    source "$srcdir/batch_opts"
    # enable cpu optimisations acording to $CPU and enable pkgopt
    if [[ "$LCPU" ]] ; then
      case $LCPU in
        *generic*) LCPU=${LCPU/generic-v/generic_cpu} ;;
        *) LCPU=m${LCPU} ;;
      esac
      CPU=${LCPU^^}
      sed -e "s|# CONFIG_M$CPU is not set|CONFIG_M$CPU=y|" \
          -e '/CONFIG_GENERIC_CPU=y/d' \
          -i "$srcdir/linux-${_basekernel}/.config"
      export _PKGOPT=y
    fi

    _BATCH_MODE=y
  fi

  #----------------------------------------
  if [[ "$_BATCH_MODE" != "y" ]]; then		# for batch building
    echo
    echo "======================================================="
    msg "You might be prompted below for some config options"
    echo "======================================================="
    echo
    msg "Hit <Y> to use your running kernel's config"
    echo "    (needs IKCONFIG and IKCONFIG_PROC)"
    msg "Hit <L> to run 'make localmodconfig'"
    msg "Hit <N> (or just <ENTER>) to build an all-inclusive kernel like stock -ARCH"
    echo "    (warning: it can take a looong time)"
    echo
    read answer
    shopt -s nocasematch
    if [[ "$answer" = "y" ]]; then
      if [[ -s /proc/config.gz ]]; then
	      msg "Extracting config from /proc/config.gz..."
	      zcat /proc/config.gz >| ./.config
      else
	      msg "running 'sudo modprobe configs'"
	      sudo modprobe configs
        if [[ -s /proc/config.gz ]]; then
	        msg "Extracting config from /proc/config.gz..."
	        zcat /proc/config.gz >| ./.config
	      else
	        msg "You kernel was not compiled with IKCONFIG_PROC."
	        msg "Attempting to run /usr/bin/modprobed_db recall from modprobe_db..."
	        if [ -e /usr/bin/modprobed-db ]; then
	          sudo /usr/bin/modprobed-db recall
	        else
	          msg "modprobed-db not installed, running make localmodconfig instead..."
	          make localmodconfig
	        fi
        fi
      fi
    elif [[ "$answer" = "l" ]]; then
      # Copied from kernel26-ck's PKGBUILD
      msg "Attempting to run /usr/bin/reload_database with sudo from modprobe_db..."
      if [ -e /usr/bin/modprobed-db ]; then
	      sudo /usr/bin/modprobed-db recall
      fi
      msg "Running 'make localmodconfig'..."
      make localmodconfig
    else
      msg "Using stock ARCH kernel .config (with BFS and BFQ)."
    fi

    # Make some good use of MAKEFLAGS
    # MAKEFLAGS=`grep -v '#' /etc/makepkg.conf | grep MAKEFLAGS= | sed s/MAKEFLAGS=// | sed s/\"//g`

    # make prepare

    # Options for additional configuration
    echo
    msg "Kernel configuration options before build:"
    echo "    <M> make menuconfig (console menu)"
    echo "    <N> make nconfig (newer alternative to menuconfig)"
    echo "    <G> make gconfig (needs gtk)"
    echo "    <X> make xconfig (needs qt)"
    echo "    <O> make oldconfig"
    echo "    <L> make localyesconfig"
    echo "    <ENTER> to skip configuration and use stock -ARCH defaults"
    read answer
    case "$answer" in
      m) make menuconfig
	       ;;
      g) make gconfig
	       ;;
      x) make xconfig
	       ;;
      n) make nconfig
	       ;;
      o) make oldconfig
         ;;
      l) make localyesconfig
	       ;;
      default)
	       ;;
    esac
    cp -v .config ${startdir}/config.local
    for _cpusuffix_kbuild in ${_CPUSUFFIXES_KBUILD[@]} ; do
	    _egrepstring="${_egrepstring}M${_cpusuffix_kbuild}=y|"
    done
    CPU=$(egrep "${_egrepstring}CONFIG_GENERIC_CPU=y|M686=y|CONFIG_MNATIVE=y" ./.config)
    CPU=$(sed -e "s/CONFIG_\(.*\)=y/\1/" <<<$CPU)
    CPU=$(sed -e "s/CONFIG_GENERIC_CPU=y/GENERIC/" <<<$CPU)
    CPU=$(sed -e "s/^686$/GENERIC/" <<<$CPU)
    cp -f .config ${startdir}/config.$CPU-$CARCH

    # Give option to rename package according to CPU
    echo
    if [[ "$CPU" != "GENERIC" ]]; then
      LCPU=$(tr '[:upper:]' '[:lower:]' <<< $CPU)
      LCPU=$(sed -e "s/entium//" -e "s/^m//" <<<$LCPU)
      echo "=============================================================="
      msg "An non-generic CPU was selected for this kernel."
      echo
      msg "Hit <G>     :  to create a generic package named linux-pf"
      msg "Hit <ENTER> :  to create a package named after the selected CPU"
      msg "               (linux-pf-${LCPU} - recommended default)"
      echo
      msg "This option affects ONLY the package name. Whether or not the"
      msg "kernel is optimized was determined at the previous config step."
      msg "Also note that CPUs newer than CORE2 or K8 will be replaced by"
      msg "by core2 or k8 respectively in the package name."
      echo "=============================================================="
      read answer
      shopt -s nocasematch
      if [[ "$answer" != "g" ]]; then
	      export _PKGOPT=y
      fi
    fi

  fi  # batch check ends here

  # only export non-generic
  if [[ $CPU != GENERIC ]] ; then
    export CPU
    export LCPU
  fi

  # rewrite configuration
  make olddefconfig

  # Build
  make all
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=('coreutils' 'kmod>=9-2' 'mkinitcpio>=0.7' 'linux-pf-preset')
  optdepends=('wireless-regdb: to set the correct wireless channels of your country'
	            'nvidia-pf: NVIDIA drivers for linux-pf'
              'uksmd: Userspace KSM helper daemon'
              'linux-firmware: firmware images needed for some devices'
	            'modprobed-db: Keeps track of EVERY kernel module that has ever been probed. Useful for make localmodconfig.')
  provides=('linux-tomoyo'
            VIRTUALBOX-GUEST-MODULES
            WIREGUARD-MODULE
            KSMBD-MODULE
            NTFS3-MODULE
            UKSMD-BUILTIN
            V4L2LOOPBACK-MODULE
            VHBA-MODULE)
  replaces=('kernel26-pf')

  cd "${srcdir}/linux-${_basekernel}"

  if [[ "$_PKGOPT" = "y" ]]; then	# package naming according to optimization
    case $CPU in
      MK8)
        pkgname="${pkgbase}-k8"
        pkgdesc="${pkgdesc} AMD K8 optimized."
	      ;;
      MK10)
        pkgname="${pkgbase}-k10"
	      pkgdesc="§{pkgdesc} AMD K10 optimized"
        ;;
      MBARCELONA)
        pkgname="${pkgbase}-barcelona"
        pkgdesc="${pkgdesc} AMD Barcelona optimized."
	      ;;
      MBOBCAT)
	      pkgname="${pkgbase}-bobcat"
	      pkgdesc="${pkgdesc} AMD Bobcat optimized."
	      ;;
      MBULLDOZER)
	      pkgname="${pkgbase}-bulldozer"
	      pkgdesc="${pkgdesc} AMD Bulldozer optimized."
	      ;;
      MPILEDRIVER)
	      pkgname="${pkgbase}-piledriver"
	      pkgdesc="${pkgdesc} AMD Piledriver optimized."
	      ;;
      MSTEAMROLLER)
        pkgname="${pkgbase}-steamroller"
	      pkgdesc="${pkgdesc} AMD Steamroller optimized."
        ;;
      MEXCAVATOR)
        pkgname="${pkgbase}-excavator"
	      pkgdesc="${pkgdesc} AMD Excavator optimized."
        ;;
      MZEN)
        pkgname="${pkgbase}-zen"
	      pkgdesc="${pkgdesc} AMD Zen optimized".
        ;;
      MZEN2)
        pkgname="${pkgbase}-zen2"
	      pkgdesc="${pkgdesc} AMD Zen3 optimized."
        ;;
      MZEN3)
        pkgname="${pkgbase}-zen3"
	      pkgdesc="${pkgdesc} AMD Zen3 optimized."
        ;;
      MCORE2)
        pkgname="${pkgbase}-core2"
        pkgdesc="${pkgdesc} Intel Core2 optimized."
        ;;
      MMPSC)
        pkgname="${pkgbase}-psc"
        pkgdesc="${pkgdesc} Intel Pentium4/D/Xeon optimized."
        ;;
      MATOM)
        pkgname="${pkgbase}-atom"
        pkgdesc="${pkgdesc} Intel Atom optimized."
        ;;
      MPENTIUMII)
        pkgname="${pkgbase}-p2"
        pkgdesc="${pkgdesc} Intel Pentium2 optimized."
        ;;
      MPENTIUMIII)
        pkgname="${pkgbase}-p3"
        pkgdesc="${pkgdesc} Intel Pentium3 optimized."
        ;;
      MPENTIUMM)
        pkgname="${pkgbase}-pm"
        pkgdesc="${pkgdesc} Intel Pentium-M optimized."
        ;;
      MPENTIUM4)
        pkgname="${pkgbase}-p4"
        pkgdesc="${pkgdesc} Intel Pentium4 optimized."
        ;;
      MNEHALEM)
	      pkgname="${pkgbase}-nehalem"
        pkgdesc="${pkgdesc} Intel Core Nehalem optimized."
	      ;;
      MSANDYBRIDGE)
        pkgname="${pkgbase}-sandybridge"
        pkgdesc="${pkgdesc} Intel Sandy Bridge optimized."
	      ;;
      MIVYBRIDGE)
        pkgname="${pkgbase}-ivybridge"
        pkgdesc="${pkgdesc} Intel Ivy Bridge optimized."
	      ;;
      MHASWELL)
        pkgname="${pkgbase}-haswell"
        pkgdesc="${pkgdesc} Intel Haswell optimized."
	      ;;
      MBROADWELL)
        pkgname="${pkgbase}-broadwell"
        pkgdesc="${pkgdesc} Intel Broadwell optimized."
	      ;;
      MSILVERMONT)
        pkgname="${pkgbase}-silvermont"
        pkgdesc="${pkgdesc} Intel Silvermont optimized."
	      ;;
      MSKYLAKE)
        pkgname="${pkgbase}-skylake"
        pkgdesc="${pkgdesc} Intel Skylake optimized."
        ;;
      MSKYLAKEX)
        pkgname="${pkgbase}-skylakex"
        pkgdesc="${pkgdesc} Intel Skylake-X optimized."
        ;;
      MCASCADELAKE)
        pkgname="${pkgbase}-cascadelake"
        pkgdesc="${pkgdesc} Intel Cascadelake optimized."
        ;;
      MCANNONLAKE)
        pkgname="${pkgbase}-cannonlake"
        pkgdesc="${pkgdesc} Intel Cannonlake optimized."
        ;;
      MICELAKE)
        pkgname="${pkgbase}-icelake"
        pkgdesc="${pkgdesc} Intel Icelake optimized."
        ;;
      MCASCADELAKE)
        pkgname="${pkgbase}-cascadelake"
        pkgdesc="${pkgdesc} Intel optimized."
        ;;
      MCOOPERLAKE)
        pkgname="${pkgbase}-cooperlake"
        pkgdesc="${pkgdesc} Intel Cooperlake optimized."
        ;;
      MTIGERLAKE)
        pkgname="${pkgbase}-tigerlake"
        pkgdesc="${pkgdesc} Intel Tigerlake optimized."
        ;;
      MSAPPHIRERAPIDS)
        pkgname="${pkgbase}-sapphirerapids"
        pkgdesc="${pkgdesc} Intel Sapphirerapids optimized."
        ;;
      MROCKETLAKE)
        pkgname="${pkgbase}-rocketlake"
        pkgdesc="${pkgdesc} Intel Rocketlake optimized."
        ;;
      MALDERLAKE)
        pkgname="${pkgbase}-alderlake"
        pkgdesc="${pkgdesc} Intel Alderlake optimized."
        ;;
      GENERIC_CPU2)
        pkgname="${pkgbase}-generic-v2"
        pkgdesc="${pkgdesc} Generic-x86-64-v2 optimized."
        ;;
      GENERIC_CPU3)
        pkgname="${pkgbase}-generic-v3"
        pkgdesc="${pkgdesc} Generic-x86-64-v3 optimized."
        ;;
      GENERIC_CPU4)
        pkgname="${pkgbase}-generic-v4"
        pkgdesc="${pkgdesc} Generic-x86-64-v4 optimized."
        ;;
      *)
        # Workaround against mksrcinfo getting the $pkdesc wrong
        pkgname="${pkgbase}"
        pkgdesc="${pkgdesc}"
        ;;
    esac


    if [[ "$pkgname" != "$pkgbase" ]]; then
      # If optimized build, conflict with generi
      conflicts=('linux-pf')
      provides+=(${pkgbase}=$pkgver)
    fi
  fi

  echo
  echo "    ========================================"
  msg  "The packages will be named ${pkgname}"
  msg  "${pkgdesc}"
  echo "    ========================================"
  echo

  ### package_linux-pf

  ### c/p from linux-ARCH

  cd "${srcdir}/linux-${_basekernel}"

  KARCH=x86

  echo # get kernel version
  kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  msg2 "Installing boot image..."

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
       DEPMOD=/doesnt/exist modules_install  # Suppress depmod

  # remove build and source links
  rm "$modulesdir"/{source,build}
  # end c/p

  # Install here so each kernel optimized flavour can ship it's own System.map,
  # since bpf symbols can differ bepending on the cflags used during build.
  # Re: #5
  install -D -m644 System.map "$modulesdir"/build/System.map
}

### package_linux-pf-headers
_package-headers() {
  pkgname=${pkgbase}-headers
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  depends=('pahole')

  cd "${srcdir}/${_srcname}"
  local _builddir="${pkgdir}/usr/lib/modules/$(<version)/build"


  # only install objtool when stack validation is enabled
  if grep -q CONFIG_STACK_VALIDATION=y .config   ; then
    install -Dt "${_builddir}/tools/objtool" tools/objtool/objtool
  fi

  # required when DEBUG_INFO_BTF_MODULES is enabled
  if grep -q CONFIG_DEBUG_INFO_BTF_MODULES=y .config ; then
    install -Dt "${_builddir}/tools/bpf/resolve_btfids" \
            tools/bpf/resolve_btfids/resolve_btfids
  fi

  msg2 "Installing build files..."
  install -dm755 "${_builddir}"
  install -Dt "${_builddir}" -m644 Makefile .config Module.symvers version \
          vmlinux localversion.*
  install -Dt "${_builddir}/kernel" -m644 kernel/Makefile


  install -D -m644 arch/${KARCH}/Makefile -t "${_builddir}/arch/${KARCH}/"

  if [ "${CARCH}" = "i686" ]; then
    install -Dm644 arch/${KARCH}/Makefile_32.cpu -t "${_builddir}/arch/${KARCH}/"
  fi

  # copy files necessary for later builds, like nvidia and vmware
  cp -a scripts "${_builddir}"


  msg2 "Installing headers..."
  cp -t "$_builddir" -a include
  # copy arch includes for external modules
  cp -t "$_builddir/arch/x86" -a arch/x86/include


  # fix permissions on scripts dir
  chmod og-w -R "${_builddir}/scripts"

  install -D -m644 -t "${_builddir}/arch/${KARCH}/kernel/" arch/${KARCH}/kernel/asm-offsets.s

  install -Dt "${_builddir}/drivers/md" -m644 drivers/md/*.h
  install -Dt "${_builddir}/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "${_builddir}/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "${_builddir}/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "${_builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "${_builddir}/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # and...
  # http://bugs.archlinux.org/task/11194
  ###
  ### DO NOT MERGE OUT THIS IF STATEMENT
  ### IT AFFECTS USERS WHO STRIP OUT THE DVB STUFF SO THE OFFICIAL ARCH CODE HAS A CP
  ### LINE THAT CAUSES MAKEPKG TO END IN AN ERROR
  ###
  if [ -d include/config/dvb/ ]; then
    install -Dm644 -t "${_builddir}/include/config/dvb/" include/config/dvb/*.h
  fi

  # add xfs and shmem for aufs building
  mkdir -p "${_builddir}/"{fs/xfs,mm}

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$_builddir/{}" \;

  echo "Removing unneeded architectures..."
  local arch
  for arch in "${_builddir}"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  echo "Removing documentation..."
  rm -r "${_builddir}/Documentation"

  echo "Removing broken symlinks..."
  find -L "${_builddir}" -type l -printf 'Removing %P\n' -delete

  echo "Removing loose objects..."
  find "${_builddir}" -type f -name '*.o' -printf 'Removing %P\n' -delete

  echo "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -bi "$file")" in
      application/x-sharedlib\;*)      # Libraries (.so)
        strip -v $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip -v $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Binaries
        strip -v $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip -v $STRIP_SHARED "$file" ;;
    esac
  done < <(find "${_builddir}" -type f -perm -u+x ! -name vmlinux -print0)

  echo "Stripping vmlinux..."
  strip -v $STRIP_STATIC "${_builddir}/vmlinux"

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "${_builddir}" "$pkgdir/usr/src/$pkgbase"
}
_package-preset-default()
{
  pkgname=linux-pf-preset-default
  provides=( "linux-pf-preset=$pkgver")
  pkgdesc="Linux-pf default preset"
  install=linux.install
  depends=("linux-pf=$pkgver")
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")

  # install fallback mkinitcpio.conf file and preset file for kernel
  install -D -m644 "${srcdir}/linux.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # sed expression for following substitutions
  local _subst="
    s|%PKGBASE%|${pkgbase}|g
    s|%KERNVER%|${_kernver}|g
    s|%EXTRAMODULES%|${_extramodules}|g
  "

  # hack to allow specifying an initially nonexisting install file
  sed "${_subst}" "${startdir}/${install}" > "${startdir}/${install}.pkg"
  true && install=${install}.pkg

  # install mkinitcpio preset file
  #sed "${_subst}" ../linux-pf.preset |
  #  install -Dm644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # install pacman hooks
  sed "${_subst}" "${srcdir}"/60-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/60-${pkgbase}.hook"
  sed "${_subst}" "${srcdir}"/90-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"

  # set correct depmod command for install
  #sed \
    #  -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/" \
    #  -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" \
    #  -i "${startdir}/linux.install"
  sed \
    -e "1s|'linux.*'|'${pkgbase}'|" \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-${pkgbase}\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-${pkgbase}.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${pkgbase}-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
}

for _p in linux-pf-headers linux-pf-preset-default ; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done
if [ "$makepkg_version" ] ; then
  if in_array ${source[*]} batch_opts ; then #FIXME bugs updpkgsums
    source batch_opts
  fi
fi

pkgname[0]=linux-pf${LCPU+-}${LCPU}

eval "package_linux-pf${LCPU+-$LCPU}() {
     $(declare -f "_package")
     _package
     }"


sha256sums=('51f3f1684a896e797182a0907299cc1f0ff5e5b51dd9a55478ae63a409855cee'
            '5770ad7cc2d34367193cfbeb2a8a37e46c73470b3f6ec7ad63a1cadab4245fbc'
            '93ebf63c9e95a9b8a7ae325ce11508334ca83fd00db9677c483216a6bdef3c68'
            '30566498a4f549e972fcd430d2fc44b2bd643c55bae20096f083f8837d8c43e4'
            '82d660caa11db0cd34fd550a049d7296b4a9dcd28f2a50c81418066d6e598864'
            '5463b44b2c66657e973bdb157e9507df5a9d4964c3689e0da9fe7c9af395d80e'
            '75f99f5239e03238f88d1a834c50043ec32b1dc568f2cc291b07d04718483919'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            '7ef319249df009695b5477e30536e3edb07bcc93a58a76a63e58b012bb7debb1'
            'c49395f97c834ccfa3d92b83576338f37795a5a47d32bade5ec8673d13004839'
            '2a80815da46a474de6562244fe946f5c4f87f93f3ed3b8bf15338081f737e1dd'
            'b6304b30b52bcafd2e04c0d894b076027212aa5e9619dab76914408a41bb9091'
            'fd0ecbc2948a490ece2cbd90623c80e210c1674ea8d8f95642c6f67cef435c4a'
            'da8e88fe8875d6dccba50adebca3bdc255733d542f8eff7feb02b1849c8ee10f'
            '05d14fdd0c145df91c9c411a5b54f064c604064ba92dd7d38e5317ba2d8a2f81'
            'e89e7bd096e2275da3247cfd030accadad153aee12621935ebf4366bd19f09cb'
            '69104795df1a9f1e862f7cb1c62d62fe3f44456835eea25ee0c6af806ff3c1b3'
            '25ce02c9f0f29474562125e6da14bdb1de0aee1a22eff5b01ff8a55aca387d0e'
            'ff8145711cb5bc602576966aea29be64b2ece7dc21141483972ab72a75d35a61'
            'bb751904717f2937813c572fac430632cce54adbd776a272c51cf1debedea85e'
            '2ef05b3b80ee83d997b738c069be3971c4092633f61d816c7a45910267b37905'
            'ec795347155a2f509491fb60c9f4e01704d86a2af432278d7bf5efd7db29f9a2'
            '05d1d9003c39ee62d50801fe6bde1003e4b13167756d5c68b9b70f7ca2c60c6c'
            '4549aed2ef400173b86bc7b3ea22209ec7cff44796e1e366d5c39ae6bdc07cef'
            'c0d6660291bb2ea1fb39e03f1ff2044b0cc1514080e22be73540affbd331dd25'
            '0fec274551ed3ef1a9bf5580ca09b31645924bb3f91915626ebdd666b6d426eb'
            '1eef8aa1a26c14dc41c8e5df1a29b812e9f44f04dd99544e4ec6d275522d3592'
            'a95a8596b88d94284dbc80c1c2238e7484602d322de688342b758088afca918e'
            '4ebe0a97c42d2f8645c5e2339f8c0bb1d8dde1bce2680dd1199672eff14d582e'
            'd826fee5724d223e56b77da0f048ce9b247ee33bbe333b896f3941233583647b'
            '1d7bebd7851d6ef0e1d1c9325f3ea310a45eab2c7d2ff798df94b67ea1302077'
            '93b9b6124929ad689226b055be89cfd13be36ca927d0bed8508b069e080b7149'
            '76c90c2615b431c20d74926c03648dc482b5959951d4a10dddcac1c8cdde1f55'
            'cc78995e6475785477e89733697492b962f3b393ad59dbf49ef34865dc2a073b'
            '6a7f697265eca470f6ef5129ab2659dd870c6846d492c23f7b9f091086f067c7'
            'bf4580c6a5a449538f48af19351d2baa7cd0c59ba8df7fcac233ca12a720554c'
            '3365e896241ae6288b4c0f79cc88934f47feaa9d5c641bcb552d2d7d868d236c'
            '53bd11efc31e9cdb77a21f911fa04f6850bce064bfcb0632d71605a60e825df2'
            '7b08d88bc5ced423c6f5170f05411d388f3063b846a8cea0be85a4a8075976be'
            '71eb6465ba77f36552ff0b377f147f28fa5314ba619e4645dcb42d79abcd9ed8'
            '67c692171dd86d33b353516d31b1e53abafcda51926368b51b6028a6733fcde0'
            '8ef046c149530dfcc50da88896098e880a06c994c29a0690beb66c6ab77825ca'
            '8705b705f9dbcd0545c5b56ab65ca0f7dfe439d1e7fdc1b88cd1afb529591f30'
            'e7117b3f0c21c235cb4fb5eaff182f4fe311327ca7da178c90a9693f79a0a19a'
            '1ed244baecf5bafc3e5e274b8afa7900d24081d35205dec013d1b2047b401ffd'
            '08999ff13ae3bd4f245b62f8a8e5350c9c4876c782928a1a3ee784c8782ce951'
            'a5fad4dc9a75bb117943c523bc85aa05caac4982f8a4bd1cd525112f57bccf1b'
            '12e37cf4d04858e25bf17be3d8389deb983623eb460bc87739164aa57cb0ec66'
            '75ece20fb46fda88b48f399dc8076d271ecaf121b7baf794771432dd9d83e4fc'
            'db69684922c5891913724a65461b6f35b7b3e4b595c446e4b4193d6d16135302'
            '51c6655a459f4f5172a31c97231d0f7a0fae9ac4d850104b39dd2dfeffedd31d'
            '2dcf6e1b0237dce0b37be39f086c74aa95f92ece0bb240045b2abe611e8047df'
            'd0f45e890e2bbd36c35b80bd6bb8bc657549b9c51726e6d838e468a19bddbb8c'
            '19b5b7303366f0fcb704de4910c85f831b9e05b249b142e8f0a16ee20e221dc0'
            '2fdce8053cf8a00db6a6fb01f5e50487758a344664ea16a43d7a107c0535cfeb'
            '9d8399ed8114e37748ba0657d62cc29ce2f68aa7d63c6ba34b50662536e31bb2'
            'be666e88314bd620da6b161929780a54b74d6264e48894ed1770008ac4765f10'
            '541ba90e1aad53e92340b24d02bb9cd4037a8bc6bc4c7c7fbebd35367cf45eb7'
            'bcda0fa7067ea39b211e64bb7b918546525c2644ea5f4b52d442c6d9f685c551'
            'e26b7d5ae4682223ed96eddeabafa690979fded479c9770a78207805ff624aa8'
            'd69f4c5abfce5c63d410fc30b2b75597133b9f638e8cb0ae1a489068507390c6'
            '6bf12da93f22f2386e6d6f1079f8aca56b5a4319e0a7c438952c0343abe45679'
            'b2087de63d389f19f4a6c60db66dab114c597a7f3711569ed4690e1c66efd171'
            'f17f57ad286e82cbd984a005b1336ab87febb9998db2dc871e00610b336c6ee2'
            'b356d5b82db62d71906cd54e3f47899312da3bc36995320b0caa4bb60cfe6cf3'
            '26d9b9bcbd45669bfc08b22db5c4b37a416581c1c9f01b5d092b5836699b32b2'
            '51ae8222e4555be471ea1b200fddccbede3ff4a692db9a2a547af692c05eac7c'
            '0bc9607ee2f3657535d3a66472935bc84d31f5b1b2c20ce1a120ebdff4438abd'
            '6241e00ef89e9aa63945cc8d57f8d7cd568d3aabf2780a559f346e641667c8bb'
            'e75a9dd060a32a9158d5855ed9b8d0e2e0fa96918e42854e135b16c2e68bd71b'
            '01ac5f362c5aa02615de9249e125d8e341b6de2ae97e68c60eae324021d4d717'
            '369dda806203e5651333541702697cb83c968fc53d963f688e89cca3c113ad36'
            '668d1d9c25c0d45611e86008cdd570e30ba37f280a504adc877ebfa26f4eb379'
            '1a1e7e39c0bec3c254437d60dbdf222e602781df33c7591927cf05963c6ed5e1'
            'cdfa1893ee96403dfced3a580ba310cba226ad9b10a6dacf2ea5fa58e49d6de0'
            '68dd95421c509626864dc247d7aee6603657dda71fbf813e8d347337c62e989c'
            '66e50e6d8dcbfedc23d908ca45317c2954839bbc799033480087ce934fd688c0'
            'b3e38059db8926a960623c933e16579e95214fd7d60bde52e51b6728982c31d5'
            '3c4ddf38b20735a9103fc9a1177ade0918c411ab67899088914efadeb43f1fd8'
            'cf9871daa25a2c36423b0b7809a08d83ba330ee2062d05b87207fb9add7eda94'
            '306bd4535ce857edd2c127e8af36f06baf962ba89d7f4406165412b1b981d064'
            'd2dd42a8c9f039b1fd61ac77086619458a418bcac49d0d44097e990289dd04c5'
            'ca1cc1b9dadb693fcce8f96f814fb9e4f7b2caea877e4483a81df9887905af80'
            '1a732f0e63212cfde3b2df7e87eaca900216f0fe4d0fd7dd188b83560e3b0239'
            'fc94de835829b9a9ec00b30c2da9e1b1f43ed5c7e1f8e079bb283205d8afdf1d'
            'c437a09e97d9c68c69fe24050544315bdaefd67331f94ec13f7d7c5974090f65'
            '865faa82098b7662955a7ab80ee9607b19578ab3c609da23762b0538b6692faa'
            'ce82e08ec05a60358d85c2637bb972c9224d89cf9a184f9dcd12aa7f5c2991d4'
            'a09c756c3e45d7163cc35288bb0ca1179035394015f4a356cd8894fd084c2db2'
            '07071685514086b64244cba23cbf381c6deac5548d3a6e9aaeb75c0b8eab91fe'
            '19db960863cd4cf8c024e6f7c2354e18ffe24293003ebd1a321ed6036db259f5'
            'f9ecf00962a08396be1f90eaa0f35c2052afefd3890701e2178db9f364a495c1'
            '979652adf95d11ca557d6476cf5ce0c50c25b07c71f1f0f0ee5e1e5b94937d02'
            'b2fa2bfd38c622d7f3652751d2aded39482331cc22a78d2a6febfde263f1c113'
            '51e91aa86e3841b69973a98ca204f025134d7d2a045251357da7a9bdca4aaeb0'
            '58939fc6e93f93e7783a498b6c2620364353ad67a47363d12e4ddbcebe65c22f'
            '6f32b2a1bcde1e2bc9590d88cd11e0dcdae828da9a34bf6ca9e7e7acffa2c83e'
            '6b054b28dcefba5385b6f3a018c2bd80844af7658809db6bec4ead3ed3ff797c'
            'd75293a554a0e572b3fecc89f4b5cd1fcf55d7ccaf198a802d77861a5fde0d8f'
            '3bcbd547dd5702f9087dccd8dd1122a612b4cd674cb76a9b21556ee8a013abab'
            'c7b5fb981b6b1981b0922674648b35ae635a7ad7eb4c5b9ce235af715a2164af'
            '10ca1bdccaa20a069e3a6ad2e4d100a3e65a8a8e1310b0594c1668da73a11c4a'
            '05f237b1e0a495d4b86099361d4910d415c922e248d96bdb08994d55c29a1172'
            '912e5e9f77c4221956686faffd57d1124764509b8892ff9cfa9e75d1d8e30790'
            '26790d65d73bd83575b2c363e5db54c5ab3f02e216eb45115d4ef22b6b680cb6'
            '38a741e359ce58e71f234f922e729bed7192d7999eebaa9adcaa103cadcd361f'
            '43629619d333c836497b9ee841430829474931dee557fc487e849f2512815c3d'
            '11608c0d06eaba285d689539726acbd8a00937d6ac9f61a92b3efaf459c349a3'
            '36621c6098729b6dcf52b2b714fec51ee1bc12bdc91fb2779203aced02f9401c'
            '01b581de8a5015a3d6f861b09746d2dc44aba3fa7ddc11efe0c3df621b2ef7d7'
            'fa7d177441c5a7e9bb92bdcd6b57051e29993f7b43872c20e42b76ffad93328e'
            '823600f5c92ad995d8a928e99654fa4fed216341de35a9f46426650bbed47982'
            '03de8897fccbb175336d9da80c8b3e384ca2a366e6948362f70ec7a993b7b045'
            '79a8a637e0122c46b55902c91d1b09b6cb38d751aa2ec5e3a8f03914563c08d5'
            'bf0fc3ee3dcbe8c37d60efb17085dd62e642f0e1d79d7b30ed912e43a3eabe81'
            '3694e1c112183dbf14dbcefdb45b8c1e229f84d484d500601201ded5e3e3ed54'
            'b792fb3851c35d835579131c77bd7b68069d1faf2cc2f6f6b682b0d31d321864'
            'e23a544fe8c87d8d9428bbd3e50a7a5d7334ca69d29c2d2564e28a359ff78cab'
            'd3fc9bd37f17b219e72c4334c8d0269bbfa40af47b0f97a90e6e066a43258ce2'
            '77fa2f49c5efeb8ee58a02ff686c754b69814f8c82f1d4b31b5514f9b88c7b72'
            '1b4dd80e9088f00d93226c9e1a7b9aa093f41678e54c49c3c6fbe20845f83f4b'
            'b4993087a58b3a9433048aa7da414a5514f529072dd1264d6d19d50391e9b15b'
            'c9c3ff503c228eefbe1d891be962e66a496948dbc2e3113fc8b8f5431f46ddf9'
            '3d2627d9b23dc2c827e9483baa9a9be8fbfb0ade38ef79deab8af7707d79ad19'
            'ebbd0323f88f0117a5cf86cbb2c1a0fcae8ea4baa36d231af67f4e272b106b69'
            '77f1b39b4147c1a30958edf5b88394bc7042f3aa6cf9bc21d4ec400c2ee5cdaf'
            '88511b4a9ee5966d497a59a93d681e855959ad807c74e0bcbc5b348ad2871e60'
            '1700f8ef559d1c33cc786348c68f41a1e21f0452c46f5f98b833cc8399965674'
            '41cf676b9ddc30098fcc01e7abdba4b32e9fe6ae56cb7a91fe92feb178357515'
            '71591c8ae9c3cf8777f62fe5556d495da67e587e5e59a1c061e3793d00b18877'
            '5844e0cc18fd9236ed927053b291c5dccae32d13b9a4f57ecdc64fcf13f6af01'
            '090f2b3c6e942cc54d1c5e9566b27cb16fdf513134310a975309ab80cdcfd3fe'
            '35db7ea210dd944ec16b55d073882e29e391884a86fbdd648f6d3231723e7d58'
            '080e1ad70ff51a52437cd68b8e23fa9517b9cbe00686a22919f499c5a0c6b4fa'
            'ee7c0c865c2095aa3974f16424717860a3fd0ce52f6ad25f7f032ccba1957bf1'
            'f9df0f6e70019cf49835819769407d0d743473a8ef0d651221281b8df60ed69d'
            '8aa663ca43059bc22b3d7a8ba5697459119aa96f118b49294568b7dcd6e4b294'
            '5114d3e0af1ec6f0717a80114b3e5a692453c65ebf7872a66abb6f0815dfd8a4'
            'fbc72be74c569f3576d4f1fc7486d87c05d7b55c1336aa36d30127a41b0c109c'
            '1a29371a46dd3e21ad0d2ab5f6690a54b925add1a03559fef38b8acf3a7d4d82'
            '023628ddf6c8e2c79308301a83768362fb087a408e2a83ccfec31b0e60195435'
            '395d3b3f51b0e44086d59cd6f397144d4d5e873f784e25087e56c31ce3ea88dc'
            '57f7c6f4d2a4bd5a32fe58d6fb3dea8ed4cdaa14a82ff2ea0c6a917c2f788a2f'
            'b0070a98b9276c91c81ed0f6557fb68b5a6ff1697ae8be210408cf4285603db0'
            '1e1731bbb3661fb5a462165bc3ef15916867d8478356fb21fc42e64bf951e472'
            '88477af3fda83a4622ebfa05b35b723b6c5ff893a1b92645f15c8ad6e4ecd782'
            'd614b3659ea67561111dd6fa1a80faefe47dd8738e3a9a0c2c830ee759836d8a'
            'fa142d6b3e46890fd99dc952c7505ff2ccc8cbbf50a1f22c16cd467a2b274f14'
            'a6ce9b5dc311240cdf457458d544b01db80d40400244e0ca38804cd6aa5bd56a'
            'ebc7b84c1e4c29937648ca828f1222c83e13f3bc43f76b4b61b4beaa67646968'
            'e09bcc3717697cb240e76ea0d1405ec1ce0d4f5eb3d70d745d73f2cf4a51c07b'
            'ce6f7d1351cd93e6c340dbb69e0f4364d73998ac20b08b532601e7b00c7a2cf1'
            '82df96ae4ee622865f84acf16937b5230a24194ae501ad6beac674d890f34c13'
            '669b6b969b2e6f1fee2f3cac8c89e9539b66fe6c5d02b1a5788893c8d0da55f3'
            '8fd9b5f76987d1c82babd499c95a4e560c3680faadf86a3ec522a59371e04e0d'
            '17e27847e259ca9042160c7731311d392dee51b5574f50ae3ab4330e1f0c47aa'
            'b1f2ddb6d951b131409762662c202cbd256e0048bfc22a374689b2cf862fafc9'
            'b4a17e6c97b486cff2d374c7ac565dea653ad57d6ac98d225aafa1afc4df1c42'
            '773795ea8f758f5357438fce546e7248064e351b366bcde7d9f109bc70316f8f'
            'c1c2b81107a171de2bdd7d7db9334bfa2cdf05e107ae398188b68a1efe88b79c'
            'a7582edae4d0c2eaa761688205e141508ee2aa1e2bb740ba3202bf38d9b7398d'
            '2846718243cdf93d3ce53325d974d528cbb85f69bff58462b9209e3eef2f2263'
            '7bf866d152061c0233ee5b776271ff98602504fb8f4b6e9221476f83daab3260'
            '64baac6bdca3e23abf662bc5ff6df423f23357c1e285b231b2424021542cc23d'
            'fa2a7a2f14bc687dfb61b8ca577d6ab261c48fa8e22b8fb99d83061926406345'
            '6ac56bfae9d163fde3bff2182973094e0ca872fe0e10cc8ed05cbe175470ccb6'
            '291f0070413d973e8b59b94e20f31ff774e3e44cdd2cd98f1771ed504347eff3'
            '5d76a897001990ce87991f84aef27d135ebbeb3e72ce1c3ec9a54a0edce51844'
            '6871198575b62efea7779d8cc59cf2ff83ba68001b05b8c943470e1f47ab7a67'
            '00f78c62d9272b806d1b3f115a94d1a98a57cd572b8ae953a280595b54de730f'
            'db91de5e9ac10d4ced6e75ad1f21a968bae34ff5d42ef7b060fd76337e085ac1'
            '028ab44455d2ebc99f0f47bb31a9e1f654acfc6f58d66461e5fdbe0436b6e2b2'
            '23b6eec5a652a112fb6c294cee71ef15c144eba5ffd0ca0ddf020089ef2463de'
            '426d9d85d26265ed2583f8c58093e391c8c2ae0552e9af2dd6c595b11f92cda1'
            'cef8a1f322cf729b0799cdb4b4b8bf454a0ebcff860f013e3d732fa5bef30d2b'
            '71710e030ab73ce9dd145106b2ab7db4af8ca762f44cbb2e7f18c4ce16ee02ff'
            '67558840c3e1f1de229b23a54342cb126735282353a4d0a8cd10e4d582e6d9d6')
# vim:set ts=2 sw=2 tw=0 et:
