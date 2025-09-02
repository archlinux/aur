#!/bin/bash
# SPDX-FileCopyrightText: 2025 Demitrius Belai <demitriusbelai at gmail dot com>
# SPDX-License-Identifier: 0BSD

export LD_LIBRARY_PATH=/opt/AnycubicSlicerNext/lib:$LD_LIBRARY_PATH

exec /opt/AnycubicSlicerNext/bin/AnycubicSlicerNext "$@"
