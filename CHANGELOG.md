# Changelog

## [1-1] - 2024-12-11

### Added
- Initial AUR package for nvidia-open-thunderbolt
- Thunderbolt eGPU hotplug support patches
- GPU lost detection for external GPUs
- Surprise removal handling
- Stale device cleanup for reconnection
- Quieter logging for expected removal

### Based On
- NVIDIA open-gpu-kernel-modules 580.105.08
- Original patches from Arch Linux package by Daniel Bermond

### Fixes
- No more kernel crashes on Thunderbolt eGPU hot-unplug
- Proper cleanup on GPU removal
- Safe removal support (nvoff script)
- Reconnection support after hot-unplug
