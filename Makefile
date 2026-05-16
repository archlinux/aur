obj-m := hp-wmi.o
ccflags-y += $(shell grep -q 'ACPI_AC_CLASS' $(KERNELDIR)/include/acpi/acpi_bus.h 2>/dev/null || echo '-DACPI_AC_CLASS=\"ac_adapter\"')
