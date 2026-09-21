#!/bin/bash
# SPDX-FileCopyrightText: 2025 Demitrius Belai <demitriusbelai at gmail dot com>
# SPDX-License-Identifier: 0BSD

export LD_LIBRARY_PATH=/opt/AnycubicSlicerNext/lib:$LD_LIBRARY_PATH

export LD_PRELOAD=/opt/AnycubicSlicerNext/lib/acnext-workbench-fix.so

export __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/50_mesa.json

exec /opt/AnycubicSlicerNext/usr/bin/AnycubicSlicerNext "$@"
